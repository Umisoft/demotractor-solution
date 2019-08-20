/**
 * Название этого файла должно быть первым в лексикографическом порядке
 * среди всех файлов sites/demotractor/src/files/templates/demotractor/js/*.js
 *
 * Это нужно для того, чтобы gulp добавил этот файл первым в compiled/demotractor.js
 */
var site = {};

/**
 * Основной модуль шаблона
 * @type {{init: site.common.init}}
 */
site.common = {

	/** Инициализирует стили и поведение на всех страницах сайта */
	init: function() {
		initMenu();

		/** Инициализирует отображение вложенных разделов меню */
		function initMenu() {
			$('.level-0 li').each(function() {
				if ($(this).find('.level-1').length) {
					$(this).addClass('baby')
					$(this).prepend('<div class="clip"></div>')
				}
				$(this).on({
					mouseenter: function() {
						$(this).addClass('hover');
					},
					mouseleave: function() {
						$(this).removeClass('hover');
					}
				});
			});

			$('.clip').on('click', function() {
				$(this).closest('.baby').toggleClass('hover');
			});
		}
	}
};

$(function() {
	site.common.init();
});
