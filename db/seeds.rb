# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def clear_and_reset(classname)
	puts "Clearing #{classname}"
	classname.classify.constantize.unscoped.destroy_all
	table = classname.tableize
	ActiveRecord::Base.connection.reset_pk_sequence!(table)
end

ActiveRecord::Base.transaction do
	puts "Creating GlobalParameters"

	clear_and_reset('GlobalParameter')

	GlobalParameter.create!([{description: "CoinApiKey", code: "coinapi", value: "2C463979-7990-4EC0-AF9C-2BAA16C064D1"}]) if GlobalParameter.find_by(code: "coinapi").nil?

	puts "Finished creating GlobalParameters"
end