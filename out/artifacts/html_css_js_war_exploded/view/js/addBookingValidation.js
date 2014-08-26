$(document).ready(function() {
    $('#BookingForm').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

        fields: {
            user_id: {
                validators: {
                    notEmpty: {
                        message: 'The name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'User ID is not valid'
                    }
                }
            },
            book_id: {
                validators: {
                    notEmpty: {
                        message: 'The name is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Book ID is not valid'
                    }
                }
            }
        }
    });
});