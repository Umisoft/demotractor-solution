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
