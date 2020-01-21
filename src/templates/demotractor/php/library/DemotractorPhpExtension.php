<?php

	use UmiCms\Service;

	/** Расширение php шаблонизатора для шаблона demotractor */
	class DemotractorPhpExtension extends ViewPhpExtension {

		/** @var string DEFAULT_FAVICON_PATH путь до фавикона по умолчанию */
		const DEFAULT_FAVICON_PATH = '/favicon.ico';

		/** @var string DEFAULT_SITE_COLOR цвет сайта по умолчанию */
		const DEFAULT_SITE_COLOR = 'orange';

		/**
		 * Инициализирует общие переменные для шаблонов.
		 * @param array $variables глобальные переменные запроса
		 * @throws Exception
		 */
		public function initializeCommonVariables(array $variables) {
			$templateEngine = $this->getTemplateEngine();
			$templateEngine->setCommonVar('variables', $variables);
			$templateEngine->setCommonVar('settings_container', $this->requestSettingsContainer());
		}

		/** @inheritDoc */
		public function getCanonicalLinkTag(array $variables) {
			if (!class_exists('SeoPhpExtension', false)) {
				return '';
			}
			return (new SeoPhpExtension($this->umiTemplaterPHP))->getCanonicalLinkTag($variables);
		}

		/** @inheritDoc */
		public function getMetaRobots(array $variables) {
			if (!class_exists('SeoPhpExtension', false)) {
				return '';
			}
			return (new SeoPhpExtension($this->umiTemplaterPHP))->getMetaRobots($variables);
		}

		/** @inheritDoc */
		public function getMetaDescription(array $variables) {
			if (!class_exists('SeoPhpExtension', false)) {
				return '';
			}
			return (new SeoPhpExtension($this->umiTemplaterPHP))->getMetaDescription($variables);
		}

		/** @inheritDoc */
		public function getMetaTitle(array $variables) {
			if (!class_exists('SeoPhpExtension', false)) {
				return '';
			}
			return (new SeoPhpExtension($this->umiTemplaterPHP))->getMetaTitle($variables);
		}

		/** @inheritDoc */
		public function getMetaKeywords(array $variables) {
			if (!class_exists('SeoPhpExtension', false)) {
				return '';
			}
			return (new SeoPhpExtension($this->umiTemplaterPHP))->getMetaKeywords($variables);
		}

		/** @inheritDoc */
		public function getMetaWithPostfix($meta) {
			if (!class_exists('SeoPhpExtension', false)) {
				return '';
			}
			return (new SeoPhpExtension($this->umiTemplaterPHP))->getMetaWithPostfix($meta);
		}

		/** @inheritDoc */
		public function getPageNumberPostfix($meta) {
			if (!class_exists('SeoPhpExtension', false)) {
				return '';
			}
			return (new SeoPhpExtension($this->umiTemplaterPHP))->getPageNumberPostfix($meta);
		}

		/** @inheritDoc */
		public function getFaviconPath() {
			if (!class_exists('SeoPhpExtension')) {
				return '';
			}
			return (new SeoPhpExtension($this->umiTemplaterPHP))->getFaviconPath();
		}

		/**
		 * Запрашивает актуальный объект настроек и возвращает его
		 * @return bool|iUmiObject
		 * @throws publicException
		 */
		public function requestSettingsContainer() {
			/** @var umiSettings|UmiSettingsMacros $module */
			$module = cmsController::getInstance()
				->getModule('umiSettings');
			$id = $module->getIdByCustomId('demotractor');
			return umiObjectsCollection::getInstance()
				->getObject($id);
		}

		/**
		 * Возвращает значение поля объекта настроек
		 * @param string $name идентификатор поля
		 * @return false|mixed
		 */
		public function getSettingsValue($name) {
			return $this->getSettingsContainer()
				->getValue($name);
		}

		/**
		 * Возвращает объект настроек сайта из кеша
		 * @return iUmiObject|bool
		 */
		public function getSettingsContainer() {
			return $this->getTemplateEngine()
				->getCommonVar('settings_container');
		}

		/**
		 * Возвращает глобальные переменные запроса
		 * @return array|bool
		 */
		public function getVariables() {
			return $this->getTemplateEngine()
				->getCommonVar('variables');
		}

		/**
		 * Возвращает адреса логотипа сайта
		 * @return string
		 */
		public function getSiteLogoUrl() {
			return $this->getVariables()['domain-url'] . $this->getSettingsImagePath('logo');
		}

		/**
		 * Возвращает название сайта
		 * @return string
		 */
		public function getSiteName() {
			return $this->getSettingsValue('site_name') ?: $this->getVariables()['site-name'];
		}

		/**
		 * Возвращает адрес изображения из поля настроек
		 * @param string $name имя поля
		 * @return string
		 */
		public function getSettingsImagePath($name) {
			$image = $this->getSettingsValue($name);
			return ($image instanceof iUmiImageFile) ? $image->getFilePath(true) : $this->getNoImageHolderPath();
		}

		/**
		 * Возвращает alt изображения из поля настроек
		 * @param string $name имя поля
		 * @return string
		 */
		public function getSettingsImageAlt($name) {
			$image = $this->getSettingsValue($name);
			return ($image instanceof iUmiImageFile) ? $image->getAlt() : '';
		}

		/**
		 * Возвращает title изображения из поля настроек
		 * @param string $name имя поля
		 * @return string
		 */
		public function getSettingsImageTitle($name) {
			$image = $this->getSettingsValue($name);
			return ($image instanceof iUmiImageFile) ? $image->getTitle() : '';
		}

		/**
		 * Возвращает значение даты страницы
		 * @param int $id идентификатор страницы
		 * @param string $fieldName имя поля с датой
		 * @param string $format формат вывода даты
		 * @return string|null
		 */
		public function getPageDate($id, $fieldName, $format = 'd.m.Y') {
			$page = umiHierarchy::getInstance()
				->getElement($id);

			if (!$page instanceof iUmiHierarchyElement) {
				return null;
			}

			$date = $page->getValue($fieldName);
			/** @var iUmiDate $date */
			return ($date instanceof iUmiDate) ? $date->getFormattedDate($format) : null;
		}

		/**
		 * Возвращает цвет сайта
		 * @return false|string
		 */
		public function getSiteColor() {
			$id = $this->getSettingsValue('site_color');
			$color = $this->getObjectById($id);
			return ($color instanceof iUmiObject) ? $color->getValue('code') : self::DEFAULT_SITE_COLOR;
		}

		/**
		 * Возвращает список социальных сетей для отображения в футере
		 * @return iUmiObject[]
		 */
		public function getFooterSocialNetworkList() {
			$socialNetworkOptionList = $this->getSettingsValue('social_networks');

			if (count($socialNetworkOptionList) === 0) {
				return $socialNetworkOptionList;
			}

			usort($socialNetworkOptionList, function($first, $second) {
				$firstIndex = $first['float'];
				$secondIndex = $second['float'];

				if ($firstIndex === $secondIndex) {
					return 0;
				}

				return ($firstIndex < $secondIndex) ? -1 : 1;
			});

			$socialNetworkIdList = array_map(function($option) {
				return $option['rel'];
			}, $socialNetworkOptionList);

			return umiObjectsCollection::getInstance()
				->getObjectList($socialNetworkIdList);
		}

		/**
		 * Возвращает класс для пункта меню
		 * @param array $item
		 * @return string
		 */
		public function getMenuItemClass(array $item) {
			$classPartList = [];

			if (isset($item['status']) && $item['status'] === 'active') {
				$classPartList[] = 'current';
			}

			if (isset($item['items']) && count($item['items']) > 0) {
				$classPartList[] = 'baby';
			}

			return implode(' ', $classPartList);
		}

		/**
		 * Определяет является ли текущая страница страницей по умолчанию
		 * @param array $variables глобальные переменные запроса
		 *
		 * [
		 *     'is-default' => bool флаг страницы по умолчанию
		 * ]
		 *
		 * @return bool
		 */
		public function isHomePage(array $variables) {
			return (bool) (isset($variables['is-default']) ? $variables['is-default'] : false);
		}

		/**
		 * Определяет является ли текущая страница страницей 404
		 * @param array $variables глобальные переменные запроса
		 *
		 * [
		 *     'module' => модуль, отвечающий за текущую страницу
		 *     'method' => метод, отвечающий за текущую страницу
		 *     'pageId' => идетификатор текущей страницы
		 * ]
		 *
		 * @return bool
		 */
		public function is404Page(array $variables) {
			return ($variables['module'] === 'content' && $variables['method'] === 'content' && !isset($variables['pageId']));
		}

		/**
		 * Определяет находится ли страница на первом уровне вложенности
		 * @param iUmiHierarchyElement $page
		 * @return bool
		 */
		public function isFirstLevelPage(iUmiHierarchyElement $page) {
			return $page->getParentId() == 0;
		}

		/**
		 * Подготавливает список хлебных крошек
		 * @param array $breadcrumbList список хлебных крошек
		 * @return array
		 */
		public function prepareBreadcrumbs(array $breadcrumbList) {
			$breadcrumbList = $this->pushHomePageToBreadcrumb($breadcrumbList);

			if (!$this->getCurrentPageId()) {
				$breadcrumbList = $this->pushNotFoundPageToBreadcrumb($breadcrumbList);
			}

			return $this->extendBreadcrumbsAttributes($breadcrumbList);
		}

		/**
		 * Добавляет главную страницу в хлебные крошки
		 * @param array $breadcrumbList хлебные крошки
		 * @return array
		 */
		public function pushHomePageToBreadcrumb(array $breadcrumbList) {
			$defaultPage = $this->getDefaultPage();

			if (!$defaultPage instanceof iUmiHierarchyElement) {
				return $breadcrumbList;
			}

			array_unshift($breadcrumbList, [
				'id' => $defaultPage->getId(),
				'link' => '/',
				'text' => $defaultPage->getName(),
				'is-default' => true
			]);

			return $breadcrumbList;
		}

		/**
		 * Добавляет 404ую страницу в хлебные крошки
		 * @param array $breadcrumbList хлебные крошки
		 * @return array
		 */
		public function pushNotFoundPageToBreadcrumb(array $breadcrumbList) {
			$breadcrumbList[] = [
				'id' => $this->getCurrentPageId(),
				'link' => '',
				'text' => $this->getSettingsValue('404_header')
			];
			return $breadcrumbList;
		}

		/**
		 * Расширяет список атрибутов хлебных крошек
		 * @param array $breadcrumbList список хлебных крошек
		 * @return array
		 */
		public function extendBreadcrumbsAttributes(array $breadcrumbList) {
			$lastIndex = count($breadcrumbList) - 1;
			$currentPageId = $this->getCurrentPageId();

			foreach ($breadcrumbList as $index => $breadcrumb) {
				$breadcrumbList[$index] = $breadcrumb + [
					'is-last' => ($lastIndex ===  $index),
					'is-current' => ($currentPageId == $breadcrumb['id'])
				];
			}

			return $breadcrumbList;
		}

		/**
		 * Возвращает css класс для хлебной крошки
		 * @param array $breadcrumb хлебная крошка
		 * @return string
		 */
		public function getBreadcrumbCssClass(array $breadcrumb) {
			if (isset($breadcrumb['is-default']) && $breadcrumb['is-default']) {
				return 'breadcrumbs_home';
			}

			return $breadcrumb['is-last'] ? 'breadcrumbs_last' : '';
		}

		/**
		 * Возвращает ссылку для хлебной крошки
		 * @param array $breadcrumb хлебная крошка
		 * @return string
		 */
		public function getBreadcrumbLink(array $breadcrumb) {
			return $breadcrumb['is-current'] ? '' : $breadcrumb['link'];
		}

		/**
		 * Возвращает css класс для пункта постраничной навигации
		 * @param array $item пункт постраничной навигации
		 * @return string
		 */
		public function getPageNavigationItemCssClass(array $item) {
			$parts = ['numpages_li'];

			if (isset($item['is-active']) && $item['is-active']) {
				$parts[] = 'active';
			}

			return implode(' ', $parts);
		}

		/**
		 * Возвращает адрес ссылки для пункта постраничной навигации
		 * @param string $linkPart часть ссылки вида ?p=123
		 * @return string
		 */
		public function getPageNavigationItemLink($linkPart) {
			return sprintf('/%s/%s', Service::Request()->getPath(), $linkPart);
		}

		/**
		 * Возвращает страницу с заданным идентификатором и помещает ее в список для быстрого доступа в eip
		 * @param int $id идентификатор страницы
		 * @return bool|iUmiHierarchyElement
		 */
		public function getPageAndPushToEditable($id) {
			$page = $this->getPageById($id);

			if ($page instanceof iUmiHierarchyElement) {
				def_module::pushEditable($page->getModule(), $page->getMethod(), $page->getId());
			}

			return $page;
		}

		/**
		 * Возвращает css класс для контейнера поля формы обратной связи
		 * @param array $field поле формы обратной связи
		 * @return string
		 */
		public function getWebFormFieldContainerCssClass(array $field) {
			$parts = ['field'];

			if (isset($field['required']) && $field['required'] === 'required') {
				$parts[] = 'required';
			}

			if (isset($field['name'])) {
				$parts[] = sprintf('field_%s', $field['name']);
			}

			return implode(' ', $parts);
		}

		/**
		 * Возвращает css класс для контейнера тега ввода значение поля формы обратной связи
		 * @param array $field поле формы обратной связи
		 * @return string
		 */
		public function getWebFormInputContainerCssClass(array $field) {
			$parts = ['field_div'];
			$parts[] = (isset($field['type']) && $field['type'] === 'text') ? 'textarea' : 'input';
			return implode(' ', $parts);
		}
	}
