update photo p set p.o_img = replace(p.o_img, "https://xn-api.icuzz.com", "https://qiqiqu.cn") where id > 0;
update photo p set p.n_img = replace(p.n_img, "https://xn-api.icuzz.com", "https://qiqiqu.cn") where id > 0;

update user u set u.avatar_url = replace(u.avatar_url, "https://xn-api.icuzz.com", "https://qiqiqu.cn") where id > 0;