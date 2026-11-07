-- Catalogo didatico de dispositivos IoT (60 registros)
-- Valores de tensao e interfaces dependem da versao e do modulo: verificar datasheet antes de ligar.
-- Pode ser executado novamente sem duplicar registros.

CREATE TABLE IF NOT EXISTS catalogo_iot (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE,
    categoria TEXT NOT NULL,
    tipo TEXT NOT NULL,
    grandeza TEXT NOT NULL,
    interface TEXT NOT NULL,
    conectividade TEXT NOT NULL,
    alimentacao TEXT NOT NULL,
    aplicacao TEXT NOT NULL
);

INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (1, 'Arduino Uno R3', 'Placa microcontroladora', 'ATmega328P', 'Entradas analogicas e digitais', 'GPIO, UART, I2C, SPI', 'Sem rede integrada', '5 V', 'Prototipagem e automacao didatica');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (2, 'Arduino Mega 2560', 'Placa microcontroladora', 'ATmega2560', 'Entradas analogicas e digitais', 'GPIO, UART, I2C, SPI', 'Sem rede integrada', '5 V', 'Projetos com muitos sensores');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (3, 'Arduino Nano classico', 'Placa microcontroladora', 'ATmega328P', 'Entradas analogicas e digitais', 'GPIO, UART, I2C, SPI', 'Sem rede integrada', '5 V', 'Prototipos compactos');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (4, 'Arduino Leonardo', 'Placa microcontroladora', 'ATmega32U4', 'Entradas analogicas e digitais', 'GPIO, USB, UART, I2C, SPI', 'Sem rede integrada', '5 V', 'Controle e interfaces USB');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (5, 'Arduino Due', 'Placa microcontroladora', 'ARM Cortex-M3', 'Entradas analogicas e digitais', 'GPIO, UART, I2C, SPI', 'Sem rede integrada', '3.3 V', 'Controle e aquisicao de dados');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (6, 'Arduino Nano 33 IoT', 'Placa microcontroladora', 'SAMD21', 'Entradas analogicas e digitais', 'GPIO, I2C, SPI, UART', 'Wi-Fi e Bluetooth LE', '3.3 V', 'Prototipos IoT compactos');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (7, 'Arduino Uno R4 WiFi', 'Placa microcontroladora', 'Renesas RA4M1', 'Entradas analogicas e digitais', 'GPIO, UART, I2C, SPI', 'Wi-Fi e Bluetooth LE', '5 V (GPIO)', 'Automacao conectada');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (8, 'NodeMCU ESP8266', 'Placa microcontroladora', 'ESP8266', 'Entradas digitais e ADC', 'GPIO, UART, I2C por software, SPI', 'Wi-Fi 2.4 GHz', '3.3 V (GPIO)', 'Telemetria pela rede');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (9, 'Wemos D1 mini ESP8266', 'Placa microcontroladora', 'ESP8266', 'Entradas digitais e ADC', 'GPIO, UART, I2C por software, SPI', 'Wi-Fi 2.4 GHz', '3.3 V (GPIO)', 'Sensores Wi-Fi compactos');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (10, 'ESP32 DevKit V1', 'Placa microcontroladora', 'ESP32', 'Entradas analogicas e digitais', 'GPIO, ADC, UART, I2C, SPI', 'Wi-Fi e Bluetooth', '3.3 V (GPIO)', 'Monitoramento e controle remoto');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (11, 'ESP32-CAM', 'Placa microcontroladora', 'ESP32 com camera', 'Captura de imagens', 'GPIO, camera, UART, SPI', 'Wi-Fi e Bluetooth', '5 V (placa), 3.3 V (GPIO)', 'Monitoramento por imagens');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (12, 'ESP32-S3 DevKit', 'Placa microcontroladora', 'ESP32-S3', 'Entradas analogicas e digitais', 'GPIO, USB, UART, I2C, SPI', 'Wi-Fi e Bluetooth LE', '3.3 V (GPIO)', 'Processamento na borda');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (13, 'Raspberry Pi Pico W', 'Placa microcontroladora', 'RP2040', 'Entradas analogicas e digitais', 'GPIO, UART, I2C, SPI', 'Wi-Fi 2.4 GHz', '3.3 V (GPIO)', 'Telemetria economica');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (14, 'Raspberry Pi 4 Model B', 'Computador de placa unica', 'Computador Linux', 'Processamento de dados', 'GPIO, USB, Ethernet, HDMI', 'Ethernet, Wi-Fi, Bluetooth', '5 V', 'Gateway e servidor IoT');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (15, 'Raspberry Pi Zero 2 W', 'Computador de placa unica', 'Computador Linux', 'Processamento de dados', 'GPIO, USB, mini HDMI', 'Wi-Fi e Bluetooth', '5 V', 'Gateway compacto');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (16, 'DHT11', 'Sensor', 'Temperatura e umidade', 'Temperatura (graus C); umidade (%UR)', 'Digital proprietaria', 'Via microcontrolador', '3.3 a 5 V', 'Monitoramento ambiental basico');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (17, 'DHT22 / AM2302', 'Sensor', 'Temperatura e umidade', 'Temperatura (graus C); umidade (%UR)', 'Digital proprietaria', 'Via microcontrolador', '3.3 a 5 V', 'Monitoramento de ambiente');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (18, 'DS18B20', 'Sensor', 'Temperatura', 'Temperatura (graus C)', '1-Wire', 'Via microcontrolador', '3.0 a 5.5 V', 'Temperatura em equipamentos');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (19, 'LM35', 'Sensor', 'Temperatura', 'Temperatura (graus C)', 'Analogica', 'Via microcontrolador', '4 a 30 V (CI)', 'Experimentos termicos');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (20, 'BME280', 'Sensor', 'Ambiente', 'Temperatura, umidade e pressao', 'I2C ou SPI', 'Via microcontrolador', '1.71 a 3.6 V (CI)', 'Estacao meteorologica');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (21, 'BMP280', 'Sensor', 'Pressao e temperatura', 'Pressao atmosferica; temperatura', 'I2C ou SPI', 'Via microcontrolador', '1.71 a 3.6 V (CI)', 'Altimetria e clima');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (22, 'SHT31', 'Sensor', 'Temperatura e umidade', 'Temperatura (graus C); umidade (%UR)', 'I2C', 'Via microcontrolador', '2.4 a 5.5 V (CI)', 'Monitoramento de ambiente');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (23, 'HC-SR501', 'Sensor', 'Movimento PIR', 'Movimento por infravermelho passivo', 'Digital', 'Via microcontrolador', '5 a 20 V (modulo comum)', 'Deteccao de movimento');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (24, 'AM312', 'Sensor', 'Movimento PIR', 'Movimento por infravermelho passivo', 'Digital', 'Via microcontrolador', '2.7 a 12 V (modulo comum)', 'Deteccao de movimento compacta');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (25, 'HC-SR04', 'Sensor', 'Distancia', 'Distancia (cm)', 'Trig/Echo digital', 'Via microcontrolador', '5 V', 'Medicao de distancia');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (26, 'VL53L0X', 'Sensor', 'Distancia ToF', 'Distancia (mm)', 'I2C', 'Via microcontrolador', '2.6 a 3.5 V (CI)', 'Proximidade de objetos');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (27, 'LDR fotorresistor', 'Sensor', 'Luminosidade', 'Variacao de luz', 'Analogica com divisor resistivo', 'Via microcontrolador', 'Depende do circuito', 'Acionamento por luminosidade');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (28, 'BH1750', 'Sensor', 'Luminosidade', 'Iluminancia (lux)', 'I2C', 'Via microcontrolador', '2.4 a 3.6 V (CI)', 'Monitoramento de iluminacao');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (29, 'TSL2561', 'Sensor', 'Luminosidade', 'Iluminancia aproximada', 'I2C', 'Via microcontrolador', '2.7 a 3.6 V (CI)', 'Estudo de iluminacao');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (30, 'MQ-2', 'Sensor', 'Gases e fumaca', 'Resposta a gases combustiveis e fumaca', 'Analogica e comparador (modulo)', 'Via microcontrolador', '5 V (modulo comum)', 'Alerta experimental de gases');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (31, 'MQ-135', 'Sensor', 'Gases', 'Resposta a diversos gases', 'Analogica e comparador (modulo)', 'Via microcontrolador', '5 V (modulo comum)', 'Experimentos de qualidade do ar');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (32, 'SCD40', 'Sensor', 'CO2', 'CO2 (ppm), temperatura e umidade', 'I2C', 'Via microcontrolador', '2.4 a 5.5 V (CI)', 'Qualidade do ar interno');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (33, 'PMS5003', 'Sensor', 'Material particulado', 'PM1.0, PM2.5 e PM10', 'UART', 'Via microcontrolador', '5 V', 'Monitoramento de particulas');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (34, 'Sensor umidade solo capacitivo', 'Sensor', 'Umidade do solo', 'Indice relativo de umidade', 'Analogica', 'Via microcontrolador', '3.3 a 5 V (modulo)', 'Irrigacao automatizada');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (35, 'Sensor chuva YL-83', 'Sensor', 'Chuva', 'Presenca de agua na placa', 'Analogica ou digital (modulo)', 'Via microcontrolador', '3.3 a 5 V (modulo)', 'Deteccao de chuva');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (36, 'Sensor nivel boia', 'Sensor', 'Nivel de liquido', 'Nivel limite de liquido', 'Contato digital', 'Via microcontrolador', 'Depende do circuito', 'Controle de reservatorio');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (37, 'Sensor vazao YF-S201', 'Sensor', 'Vazao de agua', 'Pulsos proporcionais a vazao', 'Pulsos digitais', 'Via microcontrolador', '5 a 18 V (sensor)', 'Medicao de consumo de agua');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (38, 'MPU6050', 'Sensor', 'Movimento inercial', 'Aceleracao e velocidade angular', 'I2C', 'Via microcontrolador', '2.375 a 3.46 V (CI)', 'Analise de movimento');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (39, 'ADXL345', 'Sensor', 'Aceleracao', 'Aceleracao triaxial', 'I2C ou SPI', 'Via microcontrolador', '2.0 a 3.6 V (CI)', 'Vibracao e inclinacao');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (40, 'INA219', 'Sensor', 'Corrente e tensao CC', 'Corrente e tensao em corrente continua', 'I2C', 'Via microcontrolador', '3.0 a 5.5 V (CI)', 'Monitoramento eletrico CC');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (41, 'ACS712', 'Sensor', 'Corrente', 'Corrente eletrica', 'Analogica', 'Via microcontrolador', '5 V (CI)', 'Medicao de corrente');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (42, 'Módulo RFID RC522', 'Leitor / identificacao', 'RFID 13.56 MHz', 'Identificacao de etiquetas', 'SPI', 'RFID de curta distancia', '3.3 V', 'Controle de acesso didatico');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (43, 'Receptor GNSS NEO-6M', 'Modulo de localizacao', 'GNSS / GPS', 'Latitude, longitude e tempo', 'UART', 'GNSS por satelite', '3.3 V (modulo varia)', 'Rastreamento e localizacao');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (44, 'Modulo rele 1 canal', 'Atuador', 'Chaveamento de cargas', 'Ligamento e desligamento', 'Digital', 'Via microcontrolador', '5 V (modulo comum)', 'Acionamento eletrico');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (45, 'Servo motor SG90', 'Atuador', 'Servo motor', 'Posicao angular', 'PWM de controle', 'Via microcontrolador', '4.8 a 6 V', 'Movimento controlado');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (46, 'Motor de passo 28BYJ-48', 'Atuador', 'Motor de passo', 'Movimento em passos', 'Driver ULN2003', 'Via microcontrolador', '5 V (versao comum)', 'Automacao de mecanismos');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (47, 'Buzzer ativo 5 V', 'Atuador', 'Alarme sonoro', 'Sinal acustico', 'Digital', 'Via microcontrolador', '5 V (modelo comum)', 'Alertas locais');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (48, 'LED RGB', 'Atuador', 'Sinalizacao luminosa', 'Cor e luminosidade', 'PWM / GPIO', 'Via microcontrolador', 'Depende dos LEDs e resistores', 'Indicadores de estado');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (49, 'Display OLED SSD1306', 'Interface de saida', 'Display grafico', 'Texto e graficos', 'I2C ou SPI', 'Via microcontrolador', 'Depende do modulo', 'Painel de monitoramento');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (50, 'LCD 16x2 com I2C', 'Interface de saida', 'Display alfanumerico', 'Texto em 2 linhas', 'I2C por expansor', 'Via microcontrolador', '5 V (modulo comum)', 'Painel de leitura');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (51, 'Modulo LoRa SX1276', 'Modulo de comunicacao', 'Radio LoRa', 'Transmissao de dados', 'SPI', 'LoRa sub-GHz (banda por versao)', '3.3 V', 'Telemetria de longo alcance');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (52, 'Modulo Ethernet W5500', 'Modulo de comunicacao', 'Ethernet', 'Transmissao em rede cabeada', 'SPI', 'Ethernet', '3.3 V (CI; modulos variam)', 'IoT por rede cabeada');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (53, 'Modulo SIM800L', 'Modulo de comunicacao', 'Celular GSM/GPRS', 'Dados e mensagens', 'UART', 'Rede celular 2G', '3.4 a 4.4 V (modulo)', 'Telemetria em rede movel 2G');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (54, 'Modulo SIM7600', 'Modulo de comunicacao', 'Celular LTE', 'Dados moveis', 'UART ou USB (placa)', 'Rede celular 4G', 'Depende da placa', 'Gateway com rede celular');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (55, 'Modulo microSD SPI', 'Modulo de armazenamento', 'Cartao microSD', 'Arquivos de dados', 'SPI', 'Sem rede integrada', 'Depende do modulo', 'Registro local de leituras');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (56, 'Modulo RTC DS3231', 'Modulo de tempo', 'Relogio de tempo real', 'Data e hora', 'I2C', 'Sem rede integrada', '2.3 a 5.5 V (CI)', 'Registro temporal de dados');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (57, 'Teclado matricial 4x4', 'Interface de entrada', 'Teclado', 'Comandos do usuario', 'GPIO matriz', 'Via microcontrolador', 'Depende do circuito', 'Controle local');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (58, 'Sensor magnetico reed switch', 'Sensor', 'Abertura de portas', 'Estado aberto ou fechado', 'Contato digital', 'Via microcontrolador', 'Depende do circuito', 'Monitoramento de portas');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (59, 'Encoder rotativo KY-040', 'Sensor', 'Rotacao incremental', 'Pulsos e direcao de giro', 'Digital em quadratura', 'Via microcontrolador', 'Depende do modulo', 'Interface e posicao relativa');
INSERT OR IGNORE INTO catalogo_iot (id, nome, categoria, tipo, grandeza, interface, conectividade, alimentacao, aplicacao)
VALUES (60, 'Sensor som KY-038', 'Sensor', 'Som', 'Nivel relativo de som', 'Analogica e digital (modulo)', 'Via microcontrolador', '3.3 a 5 V (modulo)', 'Deteccao simples de ruido');

-- Consultas para a aula
SELECT COUNT(*) AS total_registros FROM catalogo_iot;
SELECT categoria, COUNT(*) AS total FROM catalogo_iot GROUP BY categoria ORDER BY total DESC, categoria;
SELECT id, nome, categoria, aplicacao FROM catalogo_iot ORDER BY id;
-- PRAGMA table_info('catalogo_iot');
-- SELECT * FROM catalogo_iot WHERE nome LIKE '%ESP32%';
