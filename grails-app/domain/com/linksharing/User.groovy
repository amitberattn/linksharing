package com.linksharing

class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	String email
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	User(String username){
		this.username = username
	}

	User(String username, String password) {
		//this()
		this.username = username
		this.password = password
	}

	User(String username,String email, String password) {
		//this()
		this.username = username
		this.email = email
		this.password = password

	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof User && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		email blank: false,unique: true , email: true
		password blank: false
	}

	static mapping = {
		tablePerHierarchy(false)
		password column: '`password`'
	}
}
