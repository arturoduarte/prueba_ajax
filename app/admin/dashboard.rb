ActiveAdmin.register_page "Dashboard" do
	
	menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
	
	content title: proc{ I18n.t("active_admin.dashboard") } do
		div class: "blank_slate_container", id: "dashboard_default_message" do
			span class: "blank_slate" do
				span I18n.t("active_admin.dashboard_welcome.welcome")
				small I18n.t("active_admin.dashboard_welcome.call_to_action")
			end
		end
		
		###################33# my code##################
		columns do
			column do
				panel "Últimos Empresas agregados" do
					ul do
						Company.limit(10).map do |p|
							li p.name
						end
					end
				end
			end
			column do
				panel "Usuarios" do
					ul do
						li "Usuarios registrados: #{User.count}"
						li "Administradores registrados: #{AdminUser.count}"
					end
				end
			end
			column do
				panel "Reclamos" do
					ul do
						li "Reclamos creados: #{Comment.count}"
					end
				end
			end
		end
		
	end # content
end
