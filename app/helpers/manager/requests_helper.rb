module Manager::RequestsHelper
  def choose_view_button request
    if request.status_id == Settings.approved
      link_to t("approved")
    else
      link_to t("approve"), manager_request_path(request), method: :put,
        data: {confirm: t("answer_approve")}
    end
  end
end
