let cart = [0];
let showArray = [];
(function($,H){
    const ROOT = {
        start : function(cnfg){
            this.config = cnfg;
            this.initializeSteps();
            this.addToCartClickEvent();
            this.backButtonClickEvent();
            this.nextButtonClickEvent();
            this.cartButtonEvent();
        },

        nextButtonClickEvent : function(){
            const that = this;
            this.config.nextButton.on('click',function(){
                nowStep++;
                that.initializeSteps();
                that.checkForNext();
            })
        },

        checkForNext: function () {
            if (nowStep == 5 || nowStep == 6)
                this.config.nextButton.css('display', 'inline-block');
            else
                this.config.nextButton.css('display', 'none');

            if(nowStep == 7)
                this.config.addToCartButton.html('finish');
            else
                this.config.addToCartButton.html('Add To Cart');
        },

        productClickEvent : function(){
            const that = this;
            $(this.config.products).on('click',function(){
                if(!$(this).hasClass('disable-selected-product')){
                    that.selectionData(this);
                    that.showSteps();
                }
                else{
                    alert('به دلیل تفاوت سوکت های سی پی یو این قطعه را نمیتوانید انتنخاب کنید')
                }
            })
        },

        selectionData: function (data) {
            $(this.config.targetProduct).removeClass('selected-product');
            $(data).addClass('selected-product');
            this.config.targetProduct = data;
            this.showPrice($(`#${$(data).attr('id')} > .TitleCase > .price`));
        },

        showPrice: function (nonSubmitPrice) {
            nonSubmitPrice = this.unParseNumber(nonSubmitPrice.html());
            let price = cart[0] + nonSubmitPrice;
            this.config.showLivePrice.html(this.parseNumber(price) + " T");
        },

        addToCartClickEvent: function(){
            const that = this;
            $(this.config.addToCartButton).on('click', function () {
                if(that.config.targetProduct){
                    if($(`#${$(that.config.targetProduct).attr('id')} > p`).attr('conditionmb')){
                        that.config.cpuCondition = $(`#${$(that.config.targetProduct).attr('id')} > p`).attr('conditionmb');
                    }
                    showArray[nowStep]= +$(that.config.targetProduct).attr('id');
                    that.prepareMode();
                    that.prepareCart();
                    if(nowStep < 7){
                        nowStep++;
                        that.initializeSteps();
                    }
                    else{
                        that.exportPage();
                    }
                    if (nowStep > 0)
                        that.config.backButton.css('display', 'inline-block');
                    that.checkForNext();
                }
            })
        },

        prepareMode : function(){
            productSelectedId = $(this.config.targetProduct).attr('id');
            MODES[nowStep].ProductOBJ = $(this.config.targetProduct);
            MODES[nowStep].ProductSelectedID = +productSelectedId;
            MODES[nowStep].price = this.unParseNumber($(`#${productSelectedId} > .TitleCase > .price`).html());
        },

        prepareCart : function(){
            let price = this.unParseNumber($(`#${productSelectedId} > .TitleCase > .price`).html());
            cart[nowStep + 1] = price;
            cart[0] += price;
        },

        backButtonClickEvent: function(){
            this.config.backButton.on('click',()=>{
                cart[0] -= cart[nowStep];
                cart[nowStep] = 0;
                showArray[nowStep] = 0;
                nowStep--;
                this.initializeSteps();
                if (nowStep == 0)
                    this.config.backButton.css('display', 'none');
                this.checkForNext();
                this.deleteShowStep();
            })
        },

        initializeSteps : function(){
            this.getData(MODES[nowStep].url,(res)=>{this.renderProduct(res)});
        },

        getData : function(url,callback){
            $.get(url,(res)=>{callback(res)});
        },

        renderProduct : function(datas){
            let rendering = H.compile(this.config.handleBarProductTemplate);
            let template = datas.map((data)=>{
                return rendering(data);
            }).join("");
            this.config.productRoot.html(template);
            this.config.productTitle.html(MODES[nowStep].ProductTitle);
            this.config.products = $('.Cart');
            this.productClickEvent();
            if(MODES[nowStep].ProductSelectedID != 0){
                let prevProduct = this.config.productRoot.children().get().find(function (product) {
                    return MODES[nowStep].ProductSelectedID === +($(product).attr('id'))
                })
                this.selectionData(prevProduct);
            }
            this.disableProducts();
        },

        disableProducts : function(){
            const that = this;
            this.config.products.each(function(index,product){
                if($(`#${$(product).attr('id')} > p`).attr('conditionCPU') !== that.config.cpuCondition && nowStep == 2)
                    $(product).addClass('disable-selected-product');
            })
        },

        unParseNumber : function(number){
            number = number.split(",");
            number = number.join("");
            return +number;
        },

        parseNumber: function (number) {
            number = String(number).split("");
            let counter = 1;
            let i = number.length - 1;
            let ind = number.indexOf(".")
            if (ind != -1) {
                i = ind - 1;
            }
            for (; i >= 0; i--) {
                if (counter == 3 && i != 0) {
                    number.splice(i, 0, ",");
                    counter = 1;
                }
                else
                    counter++;
            }
            return number.join("");
        },

        showSteps : function(){
            let imgSrc;
            switch(nowStep){
                case 0:
                    imgSrc = $(`#${$(this.config.targetProduct).attr('id')} > #ghost`).attr('src');
                    $(this.config.showImage).html(`<img id="show-case" src = "${imgSrc}">`);
                    break;
                case 1:
                    if ($('#show-motherboard')){
                        $('#show-motherboard').remove();
                    }
                    imgSrc = $(`#${$(this.config.targetProduct).attr('id')} > #ghost`).attr('src');
                    $(this.config.showImage).append(`<img id="show-motherboard" src = "${imgSrc}">`);
                    $("#show-motherboard").css('margin-top','-3%');
                    $("#show-motherboard").css('margin-left','-7%');
                    break;
                case 2:
                    if($('#show-cpu')){
                        $('#show-cpu').remove();
                    }
                    imgSrc = $(`#${$(this.config.targetProduct).attr('id')} > #ghost`).attr('src');
                    $(this.config.showImage).append(`<img id="show-cpu" src = "${imgSrc}">`);
                    $("#show-cpu").css('margin-top','-5%');
                    $("#show-cpu").css('margin-left','-6%');
                    break;
                case 3:
                    if($('#show-gpu')){
                        $('#show-gpu').remove();
                    }
                    imgSrc = $(`#${$(this.config.targetProduct).attr('id')} > #ghost`).attr('src');
                    $(this.config.showImage).append(`<img id="show-gpu" src = "${imgSrc}">`);
                    $("#show-gpu").css('margin-top','3%');
                    $("#show-gpu").css('margin-left','-7%');
                    break;
                case 4:
                    if($('#show-ram')){
                        $('#show-ram').remove();
                    }
                    imgSrc = $(`#${$(this.config.targetProduct).attr('id')} > #ghost`).attr('src');
                    $(this.config.showImage).append(`<img id="show-ram" src = "${imgSrc}">`);
                    $("#show-ram").css('margin-top','-4%');
                    $("#show-ram").css('margin-left','-1%');
                    break;
            }
        },

        deleteShowStep : function(){
            switch (nowStep) {
                case 0:
                    $('#show-motherboard').remove();
                    break;
                case 1:
                    $('#show-cpu').remove();
                    break;
                case 2:
                    $('#show-gpu').remove();
                    break;
                case 3:
                    $('#show-ram').remove();
                    break;
            }
        },
        exportPage : function(){
            console.log(MODES);
            $('aside').remove();
            $('section').remove();
            let template = `<div class="export-container"><h1 class = 'export'>${this.parseNumber(cart[0])}T</h1>
            <br><button class = 'buy'>Buy</button></div>`;
            $('.all').append(template);
            $('.buy').on('click',function(){
                alert('تموم شد دیگه بیشتر از این نزدیم');
            })
        },

        cartButtonEvent : function(){
            this.config.cartButton.on('click',()=>{
                console.log(MODES);
                let template = MODES.map((mode, index)=>{
                    if (mode.ProductSelectedID !== 0 && nowStep > index){
                        let dom = mode.ProductOBJ;
                        dom.removeClass('Cart');
                        dom.addClass('product-cart');
                        return dom.get()[0];
                    }
                })
                console.log(template);
                this.config.modalBody.html(template);
            })
        },
        
    };

    ROOT.start({
        productRoot : $('#product-root'),
        handleBarProductTemplate: $('#product-template').html(),
        products : $(''),
        cpuCondition : '',
        targetProduct: $(''),
        addToCartButton : $('#add-to-cart'),
        showLivePrice: $('#now-price'),
        backButton : $('#back'),
        nextButton : $('#next'),
        showImage : $('#show-pic'),
        modalBody : $(".modal-body"),
        cartButton : $('#cart-button'),
        productTitle: $('#product-title'),
    })

})(jQuery, Handlebars);