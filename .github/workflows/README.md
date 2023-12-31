# Continuous integration and continuous delivery

С целью улучшения понимания и снижения порога вхождения новых участников в работу над проектом, в данном
документе изложено описание: 

- целей и задач;
- накладываемых ограничений;
- реализованных возможностей;

процесса непрерывной интеграции, доставки и развертывания.

## Цели: 

Реализовывать билеты на проводимые PeredelanoConf мероприятия.

## Задачи:

Автоматизировать: 
1. проверку, тестирование вносимых в исходный код изменений; 
2. доставку и обновление приложения на площадки развертывания; 

## Накладываемые ограничения:

- исходный код размещается на площадке github.com;
- работа над проектом ведется в соответствии с принятым [git-flow](https://www.notion.so/afisha-06e7b5c3ca0d4fd08631f30f2b42b2fb);
- чувствительные данные запрещено хранить в коде и образах приложения.

## Реализованные возможности:

Процесс непрерывной интеграции, доставки и развертывания реализуется 
в соответствии с подходом [DTAP-street](https://en.wikipedia.org/wiki/Development,_testing,_acceptance_and_production).

На текущий момент с реализованы следующие этапы:

### Development

Этап разработки локализован специфическими ветками (Fix/Bug/Feature)

#### Локальная проверка синтаксиса и качества вносимых изменений

Настройка, описание и примеры использование изложены в [pre-commit hook](../../.githooks/README.md)

#### Проверка синтаксиса и качества вносимых изменений

Для всех открытых pull-request's в основную ветку (main) реализован автоматический запуск параллельных задач проверки кода:

- [YAMLLint](https://yamllint.readthedocs.io) с описанными в файле [.yamllint.yml](../../.yamllint.yml) параметрами/требованиями;
- [hadoLint](https://hadolint.github.io/hadolint) с описанными в файле [.hadolint.yaml](../../.hadolint.yaml) параметрами/требованиями;
- [ansibleLint](https://ansible.readthedocs.io/projects/lint/) с описанными в файле [.ansible-lint.yml](../../.ansible-lint.yml) параметрами/требованиями;

С целью экономии ресурсов и уменьшения времени ожидания выполнение любой задачи будет прервано и произведен перезапуск
в случае добавления новых изменений в текущую ветку.

### Testing

Этап тестирования локализован основной веткой (main)

#### Проверка синтаксиса и качества вносимых изменений

После каждого внесенного в основную ветку изменения реализован автоматический запуск параллельных задач проверки кода:

- [YAMLLint](https://yamllint.readthedocs.io) с описанными в конфигурационном файле [.yamllint.yml](../../.yamllint.yml) параметрами/требованиями;
- [hadoLint](https://hadolint.github.io/hadolint) с описанными в конфигурационном файле [.hadolint.yaml](../../.hadolint.yaml) параметрами/требованиями;
- [ansibleLint]() с описанными в конфигурационном файле [.ansible-lint.yml](../../.ansible-lint.yml) параметрами/требованиями;

С целью экономии ресурсов и уменьшения времени ожидания выполнение любой задачи будет прервано и произведен перезапуск
в случае добавления новых изменений в текущую ветку.

#### Сборка образов приложения

В случае успешной проверки синтаксиса и качества исходного кода автоматически запускается сборка образа инструмента
ansible-playbook для использования его на этапе доставки и развертывания. 

С целью экономии ресурсов и уменьшения времени ожидания выполнение любой задачи будет прервано и произведен перезапуск
в случае добавления новых изменений в текущую ветку.

#### Доставка и развертывание

В случае успешной сборки и публикации нового образа приложения автоматически запускается процесс:
- конфигурирования среды эксплуатации; 
- доставка и развертывание приложения; 

реализованный в коде ansible-playbook [PlayBook.yml](../../PlayBook.yml).

Файл с чувствительными переменными окружения (.env) автоматически генерируется из 
[секретов github](https://docs.github.com/en/actions/security-guides/encrypted-secrets) и размещается в среде эксплуатации.

С целью экономии ресурсов и уменьшения времени ожидания выполнение любой задачи будет прервано и произведен перезапуск
в случае добавления новых изменений в текущую ветку.

### Acceptance

Этап приемки локализован специфической веткой (demo)

### Production

Этап производственной эксплуатации локализован специфической веткой (prod)

