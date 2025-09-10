# VSCodium - Контекст проекта для Cursor AI

## Версия и основа
**Версия Visual Studio Code**: 1.105.0 (коммит 179e2b848ee)
**Репозиторий**: https://github.com/webdes27/VSCodium.git  
**Основан на**: Официальный Microsoft VS Code из https://github.com/microsoft/vscode  
**Upstream**: Настроена синхронизация с Microsoft VSCode для автоматических обновлений  
**Последний upstream коммит**: ffabf6a1b31 (layout - allow default views to restore in primary sidebar)

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

### 9. Создание кастомной темы VSCodium
- Создана папка `extensions/theme-vscodium/` для кастомной темы
- Проанализирована оригинальная тема Cursor IDE из `D:\Source\VSCoder\Primer\theme-cursor\themes\cursor-dark-color-theme.json`
- Создан `package.json` для темы с правильными настройками
- Создан `themes/vscodium-dark.json` с точной копией цветовой схемы оригинальной темы Cursor
- Переименование кастомной темы на VSCodium - обновление всех файлов и ссылок
- Исправление структуры темы - добавление отсутствующего package.json
- Интеграция темы в product.json как встроенное расширение
- **Цветовая схема темы:**
  - Фон редактора: `#191919` (как в оригинальной теме Cursor)
  - Фон панелей: `#141414`
  - Текст меню: `#cccccc82`
  - Комментарии: `#FFFFFF5C` (курсив)
  - Строки: `#e394dc` (розовый)
  - Числа: `#ebc88d` (желтый)
  - Ключевые слова: `#83d6c5` (голубой)
  - Функции: `#efb080` (оранжевый)
- Включены семантические токены и токены цветов для различных языков программирования
- Тема интегрирована в сборку VSCodium и доступна в списке тем

### 10. Модификация Activity Bar
- Изменение ориентации Activity Bar с вертикальной на горизонтальную
- Обновление размеров и параметров для горизонтального расположения
- Изменение настройки по умолчанию `workbench.activityBar.location` на 'top'
- Модификация `ActivitybarPart` и `GlobalCompositeBar` для горизонтальной ориентации
- Обновление CSS стилей для корректного отображения горизонтального Activity Bar

### 11. Обновление иконок приложения
- Замена иконки приложения в заголовке окна (`code-icon.svg`)
- Обновление иконок установщика (`code_150x150.png`, `code_70x70.png`)
- Обновление favicon (`favicon.ico`)

### 12. Синхронизация с upstream (январь 2025)
- Выполнена синхронизация с официальным репозиторием Microsoft VSCode
- **Коммит слияния**: 179e2b848ee (Merge remote-tracking branch 'upstream/main')
- **Последний upstream коммит**: ffabf6a1b31 (layout - allow default views to restore in primary sidebar)
- Получены обновления: 297 файлов изменено, 4,187 добавлений, 3,282 удалений
- **Новые функции**:
  - Улучшения в layout и sidebar
  - Обновления в chat и AI функциях
  - Исправления в terminal и PowerShell (PSReadLine)
  - Улучшения в authentication
  - Обновления в extensions и marketplace
  - Новые компоненты MCP (Model Context Protocol)
- Проект пересобран с сохранением всех кастомных изменений VSCodium

## Текущее состояние
✅ **VSCodium 1.105.0 успешно собран и запускается**  
✅ **Создан кастомизированный установщик Windows**  
✅ **Проект опубликован на GitHub с синхронизацией upstream**  
✅ **Настроена правильная структура Git**  
✅ **Выполнен полный ребрендинг в VSCodium**  
✅ **Настроена автоматическая синхронизация с Microsoft VSCode**  
✅ **Создана кастомная тема VSCodium с точной цветовой схемой**  
✅ **Тема VSCodium Dark интегрирована в приложение как встроенное расширение**  
✅ **Проект пересобран с обновленной темой и всеми исправлениями**  
✅ **Activity Bar модифицирован для горизонтального расположения в верхней части боковой панели**  
✅ **Обновлены иконки приложения и установщика**  
✅ **Синхронизирован с последними обновлениями Microsoft VSCode (коммит ffabf6a1b31)**

## Структура проекта
```
VSCodium/
├── src/                    # Исходный код VS Code (Microsoft)
├── build/                  # Скрипты сборки Microsoft
├── scripts/               # Скрипты запуска
├── extensions/            # Кастомные расширения
│   └── theme-vscodium/    # Тема VSCodium Dark
│       ├── package.json   # Конфигурация темы
│       └── themes/        # Файлы тем
│           └── vscodium-dark.json # Тема VSCodium Dark
├── package.json           # Конфигурация (версия 1.105.0, коммит 179e2b848ee)
├── product.json           # Настройки продукта
├── .gitignore            # Исключения для Git
├── INSTALLATION_GUIDE.md # Руководство по установке
└── PROJECT_CONTEXT.md    # Этот файл
```

## Ключевые файлы
- **package.json**: Основная конфигурация проекта (версия 1.105.0, коммит 179e2b848ee)
- **product.json**: Настройки продукта VSCodium (название, иконки, etc.)
- **build/gulpfile.js**: Конфигурация сборки (destinationFolderName = "VSCodium")
- **build/win32/code.iss**: Inno Setup скрипт с кастомным позиционированием иконки
- **resources/win32/code.ico**: Главная иконка приложения VSCodium
- **resources/win32/inno-*.bmp**: Иконки установщика (разные размеры DPI)
- **scripts/code.bat**: Официальный скрипт запуска VS Code
- **out/main.js**: Скомпилированная точка входа приложения
- **extensions/theme-vscodium/package.json**: Конфигурация кастомной темы VSCodium
- **extensions/theme-vscodium/themes/vscodium-dark.json**: Файл темы с цветовой схемой VSCodium Dark

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
- **2025-01-09**: Создание кастомной темы VSCodium с точной цветовой схемой оригинальной темы Cursor IDE
- **2025-01-09**: Переименование кастомной темы на VSCodium - обновление всех файлов и ссылок
- **2025-01-09**: Исправление структуры темы - добавление отсутствующего package.json
- **2025-01-09**: Финальная пересборка проекта VSCodium с темой VSCodium Dark
- **2025-01-09**: Модификация Activity Bar - изменение с вертикального на горизонтальное расположение
- **2025-01-09**: Обновление иконок приложения и финальная пересборка с горизонтальным Activity Bar
- **2025-01-10**: Синхронизация с upstream Microsoft VSCode (коммит ffabf6a1b31) - получены обновления layout, chat, AI, terminal, authentication

---

*Этот файл обновляется при каждом значительном изменении проекта для синхронизации с Cursor AI.*
