--Start
local function delmsg (arg,data)
    for k,v in pairs(data.messages_) do
        tdcli.deleteMessages(v.chat_id_,{[0] = v.id_}, dl_cb, cmd)
    end
end
local function run(msg, matches)
    local chat_id = msg.chat_id_
    local msg_id = msg.id_
    if matches[1] == 'del' then
        if tostring(chat_id):match("^-100") then 
            if is_owner(msg) then
                if tonumber(matches[2]) > 1000 or tonumber(matches[2]) < 1 then
                    return  '🚫 *1000*> `تعداد پیام های قابل حذف هر دفعه` >*1* 🚫'
                else
                    tdcli.getChatHistory(chat_id, msg_id, 0, tonumber(matches[2]), delmsg, nil)
                    return '*'..matches[2]..'* `پیام اخیر پاک شدند`'
                end
            end
        else
            return '`این قابلیت فقط در سوپرگروه ممکن است`'
        end
    end
end

return {
    patterns = {
        '^[!#/]([Dd][Ee][Ll]) (%d*)$',
    },
    run = run
}
--End
--Channel @LuaError
