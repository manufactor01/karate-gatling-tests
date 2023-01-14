function fn() {
    var constants = {
        code: 200,
        type: "unknown",
        create_pet: {
            request: 'request/pet/create_pet.json',
            response: 'response/pet/create_pet.json'
        },
        get_pet: {
            response: 'response/pet/get_pet.json'
        },
        delete_pet: {
            response: 'response/pet/delete_pet.json'
        },
        create_user: {
            request: 'request/user/create_user.json',
            response: 'response/user/create_user.json'
        },
        get_user: {
            response: 'response/user/get_user.json'
        },
        update_user: {
            request: 'request/user/update_user.json',
            response: 'response/user/update_user.json'
        },
        delete_user: {
            response: 'response/user/delete_user.json'
        }
    };
   return constants;
}