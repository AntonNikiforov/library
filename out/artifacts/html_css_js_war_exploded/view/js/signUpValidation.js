$(document).ready(function() {
    $('#SignUpForm').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                message: 'The name is not valid',
                validators: {
                    notEmpty: {
                        message: 'The name is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The name must be more than 6 and less than 30 characters long'
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
                    notEmpty: {
                        message: 'The surname is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The surname must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[а-яА-Яa-zA-Z0-9]+$/,
                        message: 'The surname can only consist of alphabetical and number'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and cannot be empty'
                    },
                    emailAddress: {
                        message: 'The email address is not a valid'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    stringLength: {
                        min: 2,
                        message: 'The password must have at least 2 characters'
                    }
                }
            }
        }
    });
});