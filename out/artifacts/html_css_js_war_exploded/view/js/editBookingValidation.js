$(document).ready(function() {
    $('#BookingForm').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

        fields: {
            user_id: {
                validators: {
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'User ID is not valid'
                    }
                }
            },
            book_id: {
                validators: {
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Book ID is not valid'
                    }
                }
            },
            date_of_issue: {
                validators: {
                    regexp: {
                        regexp: /^\d{4}-\d{2}-\d{2}$/,
                        message: 'The date is not valid'
                    }
                }
            },
            date_of_return: {
                validators: {
                    regexp: {
                        regexp: /^\d{4}-\d{2}-\d{2}$/,
                        message: 'The date is not valid'
                    }
                }
            }
        }
    });
});