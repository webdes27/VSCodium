# VSCodium - Контекст проекта для Cursor AI

## Версия и основа
**Версия Visual Studio Code**: 1.104.0 (коммит 0762fda13da)
**Репозиторий**: https://github.com/webdes27/VSCodium.git  
**Основан на**: Официальный Microsoft VS Code из https://github.com/microsoft/vscode  
**Upstream**: Настроена синхронизация с Microsoft VSCode для автоматических обновлений  
**Последний upstream коммит**: c5866c144be (Fire event on assignment context updates)

## Краткое описание проекта
VSCodium - это кастомизированная версия Visual Studio Code, собранная из исходного кода Microsoft. Проект позволяет создавать собственные установщики и модифицировать функциональность VS Code.

## Что было сделано

### 1. Настройка окружения разработки
- Установлен Node.js v22.18.0 (требование проекта)
- Установлен Python 3.10.12 для node-gyp
- Настроен Visual Studio 2022 с Spectre-mitigated libs
- Клонирован репозиторий Microsoft VS Code

### 2. Решение проблем сборки
- **Проблема**: Ошибки компиляции native modules (vscode-policy-watcher)
- **Решение**: Установка правильной версии Node.js и Spectre-mitigated libs
- **Проблема**: Ошибки прав доступа при npm install
- **Решение**: Запуск PowerShell от имени администратора

### 3. Успешная сборка и запуск
- Выполнена полная сборка: `npm run compile`
- Создан файл `out/main.js` - точка входа приложения
- Настроен запуск через Electron: `npx electron .\out\main.js`
- Приложение успешно запускается и отображает GUI

### 4. Создание установщика
- Собран production build для Windows x64: `npx gulp vscode-win32-x64`
- Создан системный установщик: `npx gulp vscode-win32-x64-system-setup`
- Установщик: `.build\win32-x64\system-setup\VSCodeSetup.exe` (~112 МБ)
- Установщик протестирован и работает

### 5. Ребрендинг в VSCodium
- Переименование "Microsoft Code OSS" в "VSCodium" во всех конфигурационных файлах
- Обновление `product.json`: `product.nameLong`, `product.win32NameVersion`
- Изменение `gulpfile.js`: `destinationFolderName` с "VSCode" на "VSCodium"
- Обновление `build/win32/code.iss`: названия установщика и путей

### 6. Кастомизация установщика
- Замена иконок: `resources/win32/code.ico` и `inno-*.bmp`
- Настройка позиционирования иконки в установщике (Inno Setup)
- Исправление перекрытия элементов интерфейса
- Настройка приоритета отрисовки (`BringToFront`)

### 7. Обновление до VSCode 1.105.0
- Добавлен upstream репозиторий Microsoft VSCode
- Синхронизация с последней версией (1.104.0 → 1.105.0)
- **Коммит слияния**: 3ae3f484c64 (Merge remote-tracking branch 'upstream/main')
- **Upstream коммит**: c5866c144be (Fire event on assignment context updates)
- Обновление всех зависимостей через `npm install`
- Сохранение всех кастомных изменений VSCodium

### 8. Настройка Git и публикация
- Создан `.gitignore` для исключения папок сборки
- Исключены: `.build/`, `out/`, `out-build/`, `out-vscode/`, `node_modules/`
- Проект загружен на GitHub: https://github.com/webdes27/VSCodium.git
- Настроена синхронизация с upstream для будущих обновлений

## Текущее состояние
✅ **VSCodium 1.105.0 успешно собран и запускается**  
✅ **Создан кастомизированный установщик Windows**  
✅ **Проект опубликован на GitHub с синхронизацией upstream**  
✅ **Настроена правильная структура Git**  
✅ **Выполнен полный ребрендинг в VSCodium**  
✅ **Настроена автоматическая синхронизация с Microsoft VSCode**

## Структура проекта
```
VSCodium/
├── src/                    # Исходный код VS Code (Microsoft)
├── build/                  # Скрипты сборки Microsoft
├── scripts/               # Скрипты запуска
├── package.json           # Конфигурация (версия 1.105.0, коммит 3ae3f484c64)
├── product.json           # Настройки продукта
├── .gitignore            # Исключения для Git
├── INSTALLATION_GUIDE.md # Руководство по установке
└── PROJECT_CONTEXT.md    # Этот файл
```

## Ключевые файлы
- **package.json**: Основная конфигурация проекта (версия 1.105.0, коммит 3ae3f484c64)
- **product.json**: Настройки продукта VSCodium (название, иконки, etc.)
- **build/gulpfile.js**: Конфигурация сборки (destinationFolderName = "VSCodium")
- **build/win32/code.iss**: Inno Setup скрипт с кастомным позиционированием иконки
- **resources/win32/code.ico**: Главная иконка приложения VSCodium
- **resources/win32/inno-*.bmp**: Иконки установщика (разные размеры DPI)
- **scripts/code.bat**: Официальный скрипт запуска VS Code
- **out/main.js**: Скомпилированная точка входа приложения

## Команды для работы
```bash
# Установка зависимостей
npm install

# Сборка проекта
npm run compile

# Запуск в режиме разработки
npm run watch

# Запуск приложения
.\scripts\code.bat

# Создание установщика
npx gulp vscode-win32-x64-system-setup

# Синхронизация с upstream Microsoft VSCode
git fetch upstream main
git merge upstream/main
npm install
```

## Планы на будущее
- [ ] Добавление AI Agent функциональности
- [ ] Интеграция с терминалом
- [ ] Реализация горячих клавиш (Ctrl+L)
- [ ] Интеграция с редактором
- [ ] Кастомизация интерфейса

## Важные замечания
1. **Node.js версия критична**: Должна быть v22.18.0+, иначе сборка не работает
2. **Spectre mitigations обязательны**: Без них не компилируются native modules
3. **Права администратора**: Нужны для npm install и сборки
4. **Electron**: Приложение запускается через Electron, не напрямую через Node.js

## История изменений
- **2025-01-04**: Первоначальная настройка и сборка VS Code
- **2025-01-04**: Создание установщика Windows
- **2025-01-04**: Публикация на GitHub с правильным .gitignore
- **2025-01-04**: Создание документации проекта
- **2025-01-05**: Полный ребрендинг в VSCodium
- **2025-01-05**: Кастомизация иконок и установщика
- **2025-01-05**: Обновление до VSCode 1.105.0 (коммит 3ae3f484c64) с синхронизацией upstream
- **2025-01-05**: Финальная сборка и тестирование VSCodium 1.105.0

---

*Этот файл обновляется при каждом значительном изменении проекта для синхронизации с Cursor AI.*
