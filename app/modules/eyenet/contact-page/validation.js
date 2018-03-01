$('#val')
                        .form({
                            inline: 'true',
                            
                            fields: 
                            {
                            inqnum: {
                                identifier: 'inqnum',
                                rules: [
                                {
                                    type   : 'empty',
                                    prompt : 'Please enter your Mobile Number'
                                }
                                ]
                            },
                            inqsub: {
                                identifier: 'inqsub',
                                rules: [
                                {
                                    type   : 'empty',
                                    prompt : 'Please enter a Subject'
                                }
                                ]
                            },
                            inqemail: {
                                identifier: 'inqemail',
                                rules: [
                                {
                                    type   : 'email',
                                    prompt : 'Please enter a valid Email Address'
                                }
                                ]
                            },
                            inqmessage: {
                                identifier: 'inqmessage',
                                rules: [
                                {
                                    type   : 'empty',
                                    prompt : 'Please enter your Email Address'
                                }
                                ]
                            }
                            }
                        });
                        $('#submit-btn').click(function () {
                            $('form').form('validate form');
                            $('form').form('is valid', function () {
                                $('form').form('submit');
                            });
                        });