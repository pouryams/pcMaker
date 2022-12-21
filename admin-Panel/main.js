(function($){
    const ROOT = {
        start : function(cnfg){
            this.config = cnfg;
            this.stateButtonEvent();
            this.addDataButtonEvent();
            this.addSubmitModal();
        },
        ///////////////////////////////////show data func
        showData : function(state,datas){
            this.config.datas = datas;
            this.config.addDataButton.css('display','block');
            this.config.addDataButton.attr('state', state);
            this.generateTableTitle(datas);
            this.renderData(state,datas);
            this.deleteButtonEvent();
        },

        generateTableTitle : function(datas){
            let template = `<tr id="table-title">`
            for(let data in datas[0]){
                template += `<th scope="col">${data}</th>`
            }
            template += `<th scope="col">Action</th> </tr>`;
            $(this.config.tableTitle).html(template);
        },

        renderData : function(state,datas){
            let template = datas.map((data)=>{
                let piece = '<tr>';
                for(let obj in data){
                    piece += `<td class ="data">${data[obj]}</td>`;
                }
                piece += `<td>
                            <button why = "edit" class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#modal"> Edit </button>
                            <button class="btn btn-danger btn-sm" why="delete" state="${state}">Delete</button>
                        </td >
                    </tr >`;
                return piece;
            }).join("");
            this.config.root.html(template);
            this.editButtonEvent();
        },
        /////////////////////////////////////button events

        editButtonEvent : function(){
            const that = this;
            $('[why=edit]').on('click',function(){
                that.config.selectedID = $(this).parent().parent().children()[0].innerHTML;
                let data = $(this).parent().parent().children();
                let values = [];
                data.each((index,dom)=>{
                    if(index != 0 && $(dom).attr('class'))
                        values.push($(dom).html());
                })
                that.prepareModalForEdit(values);
            })
        },

        prepareModalForEdit : function(values){
            let template = '';
            let valuesCounter = 0;
            for (data in this.config.datas[0]) {
                if (data != 'id')
                    template += `<div class="col-6 my-2">
                    <input type="text" class="form-control" placeholder="${data}" value="${values[valuesCounter++]}">
                    </div>`;
            }
            this.config.modalBody.html(template);
            this.config.modalTitle.html('Edit');
            this.config.submitModal.html('ok');
            this.config.submitModal.attr('why', 'submit-edit');
        },


        stateButtonEvent : function(){
            const that = this;
            this.config.stateButtons.each((index,button)=>{
                $(button).on('click',function(){
                    let state = $(this).attr('state');
                    that.getData(`http://localhost:3000/${state}`,res=>{that.showData(state,res)});
                })
            })
        },

        addDataButtonEvent : function(){
            this.config.addDataButton.on('click',()=>{
                this.generateAddModalBody();
            })
        },

        generateAddModalBody : function(){
            let template = '';
            for (data in this.config.datas[0]) {
                if(data != 'id')
                template += `<div class="col-6 my-2">
                    <input type="text" class="form-control" placeholder="${data}">
                    </div>`;
            }
            this.config.modalBody.html(template);
            this.config.modalTitle.html('Add data');
            this.config.submitModal.html('Add');
            this.config.submitModal.attr('why', 'submit');
        },

        addSubmitModal : function(){
            const that = this;
            this.config.submitModal.on('click',function(){
                let state = that.config.addDataButton.attr('state');
                let template = `http://localhost:3000/${state}/?`;
                if ($(this).attr('why') !== "submit")
                    template += `id=${that.config.selectedID}&`
                let inputs = $('.form-control').get();
                for (let inp of inputs) {
                    if ($(inp).attr('placeholder') !== "price")
                        template += `${$(inp).attr('placeholder')}=${$(inp).val()}&`;
                    else
                        template += `${$(inp).attr('placeholder')}=${$(inp).val()}`;
                }
                that.config.closeModal.click();
                if($(this).attr('why') === "submit")
                    that.postData(template,state);
                else
                    that.putData(template, state);
            });
        },

        deleteButtonEvent : function(){
            const that = this;
            $('[why=delete]').on('click',function(){
                let id = $(this).parent().parent().children()[0].innerHTML;
                let state = $(this).attr('state');
                that.deleteData(`http://localhost:3000/${state}/${id}`,state);
            })
        },

        putData : function(url,state){
            $.ajax({
                url: url,
                type: 'PUT',
                success: function (res) {
                    $(`#${state}`).click();
                }
            });
        },

        postData : function(url,state){
            $.post(url, (res) => {$(`#${state}`).click()});
        },

        getData : function(url,callback){
            $.get(url,(res)=>{callback(res)});
        },

        deleteData : function(url,state){
            $.ajax({
                url: url,
                type: 'DELETE',
                success: function (res) {
                    $(`#${state}`).click();
                }
            });
        }
    }

    ROOT.start({
        root : $('#root'),
        stateButtons : $('[why=state]'),
        tableTitle: $('thead'),
        addDataButton : $('[why=add-data]'),
        modalBody : $($('.modal-body').children()[0]),
        submitModal : $('[why=submit]'),
        closeModal : $('[why=close]'),
        modalTitle : $('#modal-title'),
        datas : [],
        selectedID : 0,
    })


})(jQuery);