
u = User.create(
    username: 'administrator',
    password: BCrypt::Password.create('12345'),
    first_name: 'Kenneth',
    last_name: 'Kapundi',
    middle_name: '',
    email: 'kennethkapundi1@gmail.com',
    gender: 1,
    designation: 'Software Developer'
)

r = Role.create(
    name: 'Administrator', description: 'Can create users'
)

Role.create(
    name: 'User', description: 'Ordinary User'
)

UserRole.create(
    user_id: u.id, role_id: r.id
)

["Incomplete", "Complete"].each do |status|

	 Status.create(
	    name: status, description: ''
	)
end
