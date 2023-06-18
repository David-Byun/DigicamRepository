let jsp01 = {
    data: 0,
    init: function () {
        this.data = num;
        this.display();

    },
    display: function () {
        $('#jsp01').text(this.data + '');
    },
}

let loginForm ={
    init: function () {
        $('#login_btn').click(function () {
            loginForm.send()
        });
    },
    send: function () {
        $('#login_form').attr({
            'action' : '/loginImpl',
            'method' : 'post',
        });
        $('#login_form').submit();

    },
};


let registerForm = {
    init : function () {
        $('#register_btn').click(function () {
            registerForm.send()
        });
    },
    send: function () {
        $('#register_form').attr({
                'action' : '/registerImpl',
                'method' : 'post',
            }
        )
        $('#register_form').submit();
    },
};
$(function () {
    registerForm.init();
    loginForm.init();
    jsp01.init(${num});
});