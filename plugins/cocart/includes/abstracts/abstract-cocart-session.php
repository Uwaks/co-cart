<?php
/**
 * Handle data for the current customers session.
 *
 * Extends WC_Session and added a few tweaks to support our features.
 *
 * @author  Sébastien Dumont
 * @package CoCart\Abstracts
 * @since   3.0.0
 * @version 4.0.0
 */

namespace CoCart\Abstracts;

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * CoCart_Session
 */
abstract class Session extends \WC_Session {

	/**
	 * Stores cart key.
	 *
	 * @access protected
	 * @var    string $_cart_key cart key
	 */
	protected $_cart_key;

	/**
	 * Stores cart hash.
	 *
	 * @access protected
	 * @var    string $_cart_hash cart hash
	 */
	protected $_cart_hash;

	/**
	 * Get cart key.
	 *
	 * @access public
	 *
	 * @since 4.0.0 Introduced.
	 *
	 * @return string
	 */
	public function get_cart_key() {
		return $this->_cart_key;
	}

	/**
	 * Set cart key.
	 *
	 * @access public
	 *
	 * @since 4.0.0 Introduced.
	 *
	 * @param string $cart_key Cart key.
	 */
	public function set_cart_key( $cart_key ) {
		$this->_cart_key = $cart_key;
	}

	/**
	 * Get customer ID.
	 *
	 * @access public
	 * @return string
	 */
	public function get_customer_id() {
		return $this->_customer_id;
	}

	/**
	 * Set customer ID.
	 *
	 * @access public
	 * @param  string $customer_id Customer ID.
	 */
	public function set_customer_id( $customer_id ) {
		$this->_customer_id = $customer_id;
	}

	/**
	 * Get session data
	 *
	 * @access public
	 * @return array
	 */
	public function get_data() {
		return $this->_data;
	}

	/**
	 * Get cart hash
	 *
	 * @access public
	 * @return string
	 */
	public function get_cart_hash() {
		return $this->_cart_hash;
	}

}
