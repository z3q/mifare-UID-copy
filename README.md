# Mifare UID copy
Bash script to copy first 4 bytes of UID to chineese UID-writable card using libnfc. Used to copy electronic passes in simple access control systems.

#Скрипт копирования и хранения UID карточек Mifare
Используется для копирования и хранения серийных номеров пропусков в простых СКУД. UID хранятся в текстовых файлах и могут быть записаны на специальные китайские заготовки с изменяемым UID (только первые 4 байта). Работа только в режиме диалога. Используются утилиты из комплекта LibNFC.
