# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Para que esté limpio al correr los seeds
User.delete_all
Post.delete_all
Comment.delete_all

# Users
users = User.create!([
  { email: 'john.doe@gmail.com', first_name: 'John', last_name: 'Doe' },
  { email: 'jane.smith@gmail.com', first_name: 'Jane', last_name: 'Smith' },
  { email: 'juan.perez@gmail.com', first_name: 'Juan', last_name: 'Perez' },
  { email: 'beatrice.valdes@gmail.com', first_name: 'Beatrice', last_name: 'Valdes' },
  { email: 'thomas.johansen@gmail.com', first_name: 'Thomas', last_name: 'Johansen' },
  { email: 'mark.thompson@gmail.com', first_name: 'Mark', last_name: 'Thompson' },
  { email: 'elon.musk@gmail.com', first_name: 'Elon', last_name: 'Musk' },
  { email: 'will.smith@gmail.com', first_name: 'Will', last_name: 'Smith' },
  { email: 'luis.bretti@gmail.com', first_name: 'Luis', last_name: 'Bretti' },
  { email: 'peter.johnson@gmail.com', first_name: 'Peter', last_name: 'Johnson' }
])

# Posts
posts = Post.create!([
  { 
    title: 'The Future of Technology', 
    content: 'The future of technology is looking incredibly promising. From advancements in AI and machine learning to space exploration, the possibilities are endless. Companies like SpaceX and Tesla are pushing the boundaries of what we thought was possible, and it’s exciting to see where this will take us in the next decade.', 
    published: 1, 
    author: 'elon.musk@gmail.com'
  },
  { 
    title: 'Climate Change and its Impact', 
    content: 'Climate change is one of the most pressing issues of our time. The effects are already being felt around the world, from extreme weather events to rising sea levels. It’s crucial that we take action now to reduce our carbon footprint and invest in renewable energy sources. The future of our planet depends on it.', 
    published: 1, 
    author: 'jane.smith@gmail.com'
  },
  { 
    title: 'The Importance of Education', 
    content: 'Education is the foundation of a successful society. It provides individuals with the knowledge and skills they need to thrive in their personal and professional lives. Investing in education, particularly in STEM fields, is essential for the continued growth and development of our global economy.', 
    published: 1, 
    author: 'john.doe@gmail.com'
  },
  { 
    title: 'Exploring the Great Outdoors', 
    content: 'There’s nothing quite like spending time in nature. Whether it’s hiking through the mountains, camping under the stars, or simply taking a walk in the park, being outdoors has numerous benefits for both physical and mental health. It’s important to take time out of our busy lives to connect with the natural world.', 
    published: 0, 
    author: 'thomas.johansen@gmail.com'
  },
  { 
    title: 'The Role of Art in Society', 
    content: 'Art plays a vital role in society. It allows individuals to express themselves, challenges societal norms, and provides a window into different cultures and perspectives. Whether it’s through painting, music, literature, or film, art has the power to inspire and bring people together.', 
    published: 1, 
    author: 'beatrice.valdes@gmail.com'
  },
  { 
    title: 'The Benefits of a Healthy Diet', 
    content: 'Maintaining a healthy diet is essential for overall well-being. A balanced diet provides the body with the nutrients it needs to function properly and can prevent a range of health issues, including heart disease, diabetes, and obesity. Incorporating more fruits, vegetables, and whole grains into your diet is a great place to start.', 
    published: 0, 
    author: 'mark.thompson@gmail.com'
  },
  { 
    title: 'The Impact of Social Media', 
    content: 'Social media has completely transformed the way we communicate and interact with the world. While it has its benefits, such as connecting people across the globe, it also has its drawbacks, including the spread of misinformation and the impact on mental health. It’s important to use social media mindfully and be aware of its potential effects.', 
    published: 1, 
    author: 'juan.perez@gmail.com'
  },
  { 
    title: 'Advancements in Renewable Energy', 
    content: 'Renewable energy is the key to a sustainable future. With advancements in solar, wind, and hydroelectric power, we are moving closer to a world that relies less on fossil fuels and more on clean, renewable sources of energy. These advancements not only benefit the environment but also create new job opportunities and drive economic growth.', 
    published: 1, 
    author: 'peter.johnson@gmail.com'
  },
  { 
    title: 'The Rise of Remote Work', 
    content: 'Remote work has become increasingly popular, particularly in the wake of the COVID-19 pandemic. It offers employees more flexibility and work-life balance, while also allowing companies to tap into a global talent pool. However, it also comes with challenges, such as maintaining company culture and ensuring effective communication.', 
    published: 0, 
    author: 'will.smith@gmail.com'
  },
  { 
    title: 'Exploring New Culinary Trends', 
    content: 'The culinary world is constantly evolving, with new trends emerging all the time. From plant-based diets to fusion cuisine, there’s always something new to explore. These trends not only reflect changes in consumer preferences but also highlight the creativity and innovation of chefs and food enthusiasts around the world.', 
    published: 1, 
    author: 'luis.bretti@gmail.com'
  }
])

# Comments
comments = Comment.create!([
  { 
    content: 'This is so true, Elon! The advancements in AI are truly remarkable, and I can’t wait to see what the future holds.', 
    author: 'john.doe@gmail.com',
    post_id: posts[0].id 
  },
  { 
    content: 'Absolutely, Jane. Climate change is a huge issue, and we all need to do our part to make a difference.', 
    author: 'beatrice.valdes@gmail.com',
    post_id: posts[1].id 
  },
  { 
    content: 'Education is key to everything. It’s the foundation upon which we build our future.', 
    author: 'thomas.johansen@gmail.com',
    post_id: posts[2].id 
  },
  { 
    content: 'Couldn’t agree more, Thomas. There’s nothing better than getting out into nature and disconnecting from technology for a while.', 
    author: 'mark.thompson@gmail.com',
    post_id: posts[3].id 
  },
  { 
    content: 'Art is such an important part of our culture. It allows us to see the world from different perspectives.', 
    author: 'juan.perez@gmail.com',
    post_id: posts[4].id 
  },
  { 
    content: 'A healthy diet really does make all the difference. It’s amazing how much better you feel when you eat right.', 
    author: 'jane.smith@gmail.com',
    post_id: posts[5].id 
  },
  { 
    content: 'Social media is definitely a double-edged sword. It can be great, but it can also be really harmful if we’re not careful.', 
    author: 'will.smith@gmail.com',
    post_id: posts[6].id 
  },
  { 
    content: 'Renewable energy is the future, no doubt about it. We just need to keep pushing for more advancements.', 
    author: 'peter.johnson@gmail.com',
    post_id: posts[7].id 
  },
  { 
    content: 'Remote work has been a game-changer for me. I love the flexibility, but it does come with its own set of challenges.', 
    author: 'elon.musk@gmail.com',
    post_id: posts[8].id 
  },
  { 
    content: 'I love trying out new food trends. It’s amazing how much the culinary world has to offer!', 
    author: 'luis.bretti@gmail.com',
    post_id: posts[9].id
  }
])
