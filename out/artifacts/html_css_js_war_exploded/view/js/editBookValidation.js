$(document).ready(function() {
    $('#BookForm').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

        fields: {
            name: {
                message: 'The name is not valid',
                validators: {
                    stringLength: {
                        min: 1,
                        max: 30,
                        message: 'The name must be more than 1 and less than 30 characters long'
                    }
                }
            },
            author: {
                message: 'The author is not valid',
                validators: {
                    stringLength: {
                        min: 1,
                        max: 30,
                        message: 'The author must be more than 1 and less than 30 characters long'
                    }
                }
            },
            year: {
                validators: {
                    regexp: {
                        regexp: /^[0-9]{4}$/,
                        message: 'The year can only consist number'
                    }
                }
            },
            num: {
                validators: {
                    regexp: {
                        regexp: /^[0-9]{1,2}$/,
                        message: 'The number is not valid'
                    }
                }
            }
        }
    });
});