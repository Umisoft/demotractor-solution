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

/**
 * Модуль главной страницы
 * @type {{
 *      init: site.homePage.init,
 *      getSliderSettings: (function(jQuery, String, Integer): {Object}),
 *      initMainImage: site.homePage.initMainImage,
 *      initSlider: site.homePage.initSlider
 *  }}
 */
site.homePage = {

	/** Инициализирует интерактивные элементы на главной странице */
	init: function() {
		this.initMainImage();
		this.initSlider($('.mainpage_items_catalog'), $('.mainpage_catalog_title'), '', 5);
		this.initSlider($('.special_offers_list'), $('.index_special_offers'), 'spec_', 3);
	},

	/** Анимирует отображение главного изображения */
	initMainImage: function() {
		setTimeout(function () {
			$('.direction_block_2').addClass('customing');
		}, 1300);
	},

	/**
	 * Инициализирует слайдер
	 * @param {jQuery} $slidesContainer контейнер со слайдами
	 * @param {jQuery} $navigationContainer контейнер с кнопками навигации
	 * @param {String} idPrefix префикс для идентификатора кнопок навигации
	 * @param {Integer} maxItemsDefault количество отображаемых слайдов
	 */
	initSlider: function ($slidesContainer, $navigationContainer, idPrefix, maxItemsDefault) {
		if ($slidesContainer.length === 0) {
			return;
		}

		$navigationContainer.prepend('<a class="prev" id="' + idPrefix + 'cato_prev" href="#"></a>');
		$navigationContainer.prepend('<a class="next" id="' + idPrefix + 'cato_next" href="#"></a>');
		$slidesContainer.carouFredSel(this.getSliderSettings($slidesContainer, idPrefix, maxItemsDefault));
	},

	/**
	 * Возвращает настройки слайдера
	 * @param {jQuery} $slidesContainer контейнер со слайдами
	 * @param {String} idPrefix префикс для идентификатора кнопок навигации
	 * @param {Integer} maxItemsDefault количество отображаемых слайдов
	 * @returns {Object}
	 */
	getSliderSettings: function ($slidesContainer, idPrefix, maxItemsDefault) {
		var itemWidthDefault = 280;
		var settings = {
			circular: false,
			infinite: false,
			auto: {
				play: false
			},
			align: "left",
			prev : '#' + idPrefix + 'cato_prev',
			next : '#' + idPrefix + 'cato_next',
			responsive: true,
			easing: "easeOutBounce",
			items : {
				width: $slidesContainer.data('item-width') || itemWidthDefault,
				visible: {
					min: 1,
					max: $slidesContainer.data('item-max') || maxItemsDefault
				}
			},
			swipe: {
				onTouch: true,
				onMouse: false,
				items: 1,
				easing: "linear",
				duration: 300
			},
			mousewheel: false
		};

		var itemHeight = $slidesContainer.data('item-height');

		if (itemHeight) {
			settings.items.height = itemHeight;
		}

		return settings;
	}
};

$(function() {
	if (window.pageData.page.is_default === true) {
		site.homePage.init();
	}
});

/**
 * Модуль кнопок социальных сетей
 * @type {{open: (function(*): boolean)}}
 */
site.socialButtons = {

	/**
	 * Открывает окно для шеринга страницы в выбранной социальной сети
	 * @param {String} name имя социальной сети
	 * @returns {Boolean}
	 */
	open: function(name) {
		var title = encodeURIComponent(document.title);
		var url = encodeURIComponent(location.href);
		var href = '';

		switch (name) {
			case 'social_vk': {
				href = 'https://vkontakte.ru/share.php?url=' + url;
				break;
			}
			case 'social_odnoklassniki': {
				href = 'https://connect.ok.ru/offer?url=' + url + '&title=' + title;
				break;
			}
			case 'social_mir': {
				href = 'https://connect.mail.ru/share?url=' + url + '&title=' + title;
				break;
			}
			case 'social_twitter': {
				href = 'https://twitter.com/home?status=' + title + '+' + url;
				break;
			}
			case 'social_livejournal': {
				href = 'https://www.livejournal.com/update.bml?event=' + url + '&subject=' + title;
				break;
			}
		}
		window.open(href, '_blank', 'width=640, height=480');
		return false;
	}
};
/**
 * Модуль формы обратной связи
 * @type {{validate: site.webForms.validate}}
 */
site.webForms = {

	/**
	 * Валидирует заполнение полей формы
	 * @param {HTMLElement} form форма
	 * @returns {Boolean}
	 */
	validate: function(form) {
		var that = this;
		var $form = $(form);
		var errorOccurred = false;
		var success = true;

		$('div.required', $form).each(function() {
			var $fieldContainer = $(this);
			var $inputContainer = $('div.field_div', $fieldContainer);

			if ($inputContainer.length > 0) {
				errorOccurred = that.checkRequiredFields($inputContainer);

				if (errorOccurred) {
					success = false;
				}

				that.toggleEmptyRequiredFieldMessage(errorOccurred, $fieldContainer);
			}

			if ($fieldContainer.hasClass('field_email')) {
				errorOccurred = that.checkEmailField($inputContainer);

				if (errorOccurred) {
					success = false;
				}

				that.toggleIncorrectEmailFieldMessage(errorOccurred, $fieldContainer);
			}

			if ($fieldContainer.hasClass('accept_pdn')) {
				errorOccurred = $('input[type = "checkbox"]', $fieldContainer).is(":checked") === false;

				if (errorOccurred) {
					success = false;
				}

				that.toggleEmptyRequiredFieldMessage(errorOccurred, $fieldContainer);
			}
		});

		return success;
	},

	/**
	 * Проверяет заполнено ли обязательное поле
	 * @param {jQuery} $inputContainer контейнер со значением поля формы
	 * @returns {Boolean}
	 */
	checkRequiredFields: function($inputContainer) {
		var value = $inputContainer.hasClass('input') ? $('input', $inputContainer).val() : $('textarea', $inputContainer).val();
		return (typeof value !== 'string' || value.length === 0);
	},

	/**
	 * Проверяет корректность заполнения почтового ящика
	 * @param {jQuery} $inputContainer контейнер со значением поля формы
	 * @returns {Boolean}
	 */
	checkEmailField: function($inputContainer) {
		return $('input', $inputContainer).val().toString().match(/.+\@.+\..+/) === null;
	},

	/**
	 * Переключает отображение сообщения об ошибке заполнения обязательного поля
	 * @param {Boolean} errorOccurred определяется произошла ли ошибка
	 * @param {jQuery} $fieldContainer контейнер поля
	 */
	toggleEmptyRequiredFieldMessage: function(errorOccurred, $fieldContainer) {
		if (errorOccurred) {
			$fieldContainer.addClass('verification_error');
			return;
		}

		$fieldContainer.removeClass('verification_error');
	},

	/**
	 * Переключает отображение сообщения об ошибке заполнения поля с почтовым ящиком
	 * @param {Boolean} errorOccurred определяется произошла ли ошибка
	 * @param {jQuery} $fieldContainer контейнер поля
	 */
	toggleIncorrectEmailFieldMessage: function(errorOccurred, $fieldContainer) {
		if (errorOccurred) {
			$fieldContainer.addClass('email_verification_error');
			return;
		}

		$fieldContainer.removeClass('email_verification_error');
	}
};