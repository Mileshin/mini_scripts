# Тут хранятся разные мелкие скрипты, полезные и не очень.
<h2> checking_mirrors.bash </h2>
 Этому скрипту, необходимо передать Database(можно больше одного) который необходимо проверить. Скрипт пропингует все зеркала и выведет результат.
<h2> enabling_disk_quotas.bash </h2>
Если установлен ispmanager5, этот скрипт найдет DefaultHomeDir и проверит, включены ли квоты на диске с этим каталогом.
<h2> myfreshclam.bash </h2>
Скрипт призван решить постоянные проблемы в обновлении clamav. Он удаляет все старые файлы и через wget подтягивает последние версии этих файлов.
<h2>  hosts_logrotate.bash </h2>
Для всех директорий в /var/www/ создает поддиректорию logs(если ее не было) и генерирует правило для logrotate, сохраняя  его в файл с именем переданным первым аргументом
<h2> install_nginx_http2.bash </h2>
Собирает nginx вместе с модулем для поддержки http2.
<h2> docker_dead_tom.sh </h2>
Находит те тома, на которые не ссылается не один контейнер
<h2> cleanup-docker.sh </h2>
Очищает весь мусор, который мог остаться из-за работы докера
<h2> delete-queue-by-email.sh </h2>
Удаляет все сообщения из очередей postfix.</br>
Можно сменить пути до команд, чтобы например он заработал на zimbra.
С ключем -p будут выведены все найденные идентификаторы, с ключем -d они будут удалены.
<h2> zimbra_update_mailbox_quotas.sh </h2>
Находит все аккаунты zimbra на заданном сервере и если квота на них меньше заданной, то увеличивает ее или сбрасывает до значения класса ослуживания.
