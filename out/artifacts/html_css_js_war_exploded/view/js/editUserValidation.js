$(document).ready(function() {
    $('#UserForm').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

        fields: {
            name: {
                message: 'The name is not valid',
                validators: {
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: 'The name must be more than 2 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[а-яА-Яa-zA-Z0-9]+$/,
                        message: 'The name can only consist of alphabetical and number'
                    }
                }
            },
            surname: {
                message: 'The surname is not valid',
                validators: {
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: 'The surname must be more than 2 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[а-яА-Яa-zA-Z0-9]+$/,
                        message: 'The surname can only consist of alphabetical and number'
                    }
                }
            },
            email: {
                validators: {
                    emailAddress: {
                        message: 'The email address is not a valid'
                    }
                }
            },
            password: {
                validators: {
                    stringLength: {
                        min: 2,
                        message: 'The password must have at least 2 characters'
                    }
                }
            }
        }
    });
});