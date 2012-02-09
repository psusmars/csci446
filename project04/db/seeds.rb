# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.delete_all

50.times do
	Article.create( title: 'Lorem Ipsum',
		author: 'Donald Norman',
		body: '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc in nisi eget leo tristique ultrices in sed nunc. Quisque tempor, tellus eu pellentesque tincidunt, metus lectus euismod orci, nec bibendum neque libero eu ipsum. Suspendisse ac arcu justo. Quisque lorem ipsum, faucibus in volutpat ut, imperdiet sed ligula. Maecenas vestibulum eleifend viverra. Vivamus varius, mi sed interdum lobortis, nisi urna posuere dui, eget facilisis erat erat in augue. Praesent vestibulum diam bibendum velit suscipit vestibulum. Suspendisse ultrices nisi non nulla pharetra viverra commodo eros euismod. Mauris arcu ante, eleifend id convallis id, consectetur sit amet augue. Fusce vitae ante congue purus ultricies dictum a sollicitudin lorem. Vestibulum nec lorem nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque quis quam orci. Integer pellentesque enim nec nisl tempor eu sollicitudin neque dignissim. Sed ut nunc neque, sed venenatis leo.

					Suspendisse tempor, est et pulvinar ornare, leo lacus elementum elit, sit amet iaculis sapien mauris eget urna. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec mattis lacus leo. Mauris at auctor lacus. Mauris venenatis vestibulum blandit. Nullam vitae ante et nunc mollis consectetur luctus eu elit. Mauris cursus tortor sed ante sagittis iaculis. Integer in risus id magna pharetra varius. Duis augue elit, facilisis facilisis semper in, accumsan sed eros. Nullam congue rutrum turpis vel mollis.

					Mauris tempor dapibus enim non mattis. Pellentesque condimentum nisl in ante pharetra accumsan. Proin odio ipsum, placerat eget placerat ut, posuere nec arcu. In vel volutpat justo. Donec euismod mi leo, id vulputate elit. Donec sit amet lectus augue, at tristique dolor. Donec vestibulum erat vitae nisi porta cursus.</p>'
		)	
end