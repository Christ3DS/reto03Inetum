function fn() {

    karate.log('KARATE CONFIG INGRESÓ');

    var env = karate.env || 'integracion';

    var config = {
        env: env,
        transactionId: java.util.UUID.randomUUID().toString()
    };

    if (env == 'integracion') {
        config.baseUrl = 'https://petstore.swagger.io/v2';
        config.secretName = 'secretdqa01';
    } else if (env == 'certificacion') {
        config.baseUrl = 'https://petstore.swagger.io/v2';
        config.secretName = 'secretcqa01';
    } else if (env == 'produccion') {
        config.baseUrl = 'https://petstore.swagger.io/v2';
        config.secretName = 'secretpqa01';
    }

    config.apiKey = java.lang.System.getenv('API_KEY');

    karate.log('Environment:', env);
    karate.log('Base URL:', config.baseUrl);

    return config;
}

