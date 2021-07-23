<?php
/**
 * CoCart - Products controller
 *
 * Handles requests to the /products/reviews/ endpoint.
 *
 * @author   Sébastien Dumont
 * @package  CoCart\API\Products\v2
 * @since    3.1.0
 * @license  GPL-2.0+
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * REST API Product Reviews controller class.
 *
 * @package CoCart/API
 * @extends CoCart_Product_Reviews_V2_Controller
 */
class CoCart_Product_Reviews_V2_Controller extends CoCart_Product_Reviews_Controller {

	/**
	 * Endpoint namespace.
	 *
	 * @var string
	 */
	protected $namespace = 'cocart/v2';

}
