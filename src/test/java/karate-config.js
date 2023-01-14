function fn() {
    var env = karate.env;
    if (!env) {
        env = "qa";
    };
    karate.log("karate environment system property is: ", env);
    var config = {
        path_pet: 'pet',
        path_user: 'user'
    };
    config.environment = karate.call('classpath:core/environment/config-' + env + '.js');
    config.constants = karate.call('classpath:core/constants/constants.js');
    return config;
}