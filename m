Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172280;
	b=utNXhI+htyvqFTFNmVgL59GaGvnkAT0xDIKkQ1nUSWQd0dLRmzb7eK6zdzGaRivd+Ulb
	 Ph5w2j+5ZdHkSTKNjnd8w4y02zGo+eXyxEgRZYcNPHTX3eHG6SggrYqz0GCD2pwSrGL93
	 1KKpvpXCm+Dc5QD/Fjv9P3DS+Hr3EHZl9tpteanwI1YXEksaEVFOOZLzOPrUSz7G04IL5
	 LA96W7yr4+TG/DKJZhdxdYhs2amDnrphMsC94Yv/PCgBaQs9IZpXq8dcQ0wHS+qMHf7ur
	 zzdK0UJaHpfqnwXMscae+2jyLp4zKVaiUky+jYOBETcOFjpf3I27p0vtlNXeikwQ5fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+aoykV8a18EfGjtngppAxydVm7TBp0whXeYggjz5TCk=;
	b=xxknxLcx9CQFskjFNSYNY5M1A9D0eYZBFvgwONQgVzCA5+QLiNkS6YwFiekaeTg1JT2Z
	 +WKtQg7wY2PuRGOQdkOaSrSAN39nxIzMWgbCmXmb1yC400y/GwVSxDCqF1j2+RdTrDKP8
	 deynUVGdqWxEroJ3teIAT5Lpke940emjNjK2Ko5FVLGPlmPCt1Yu0QLYklFEujGYDfNbW
	 /j7Ikym41CS2Db0TbOdiWPopwOzYWfwGYILlCF0fKtccH3Fl7RaGJtjnkB5Nlp/w+yXIT
	 ZzrTuaXhYKbmN/i3gPVLq5Cg0rgGHOxJ2n4/EYCXO5Z/VuV4iJrkLAL+Nueufl8IPAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YgdH+GeA;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8156606A320
	for <sophgo@lists.linux.dev>; Fri, 20 Nov 2026 10:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8156606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YgdH+GeA
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-382f4710a17so1202990eec.0
        for <sophgo@lists.linux.dev>; Fri, 20 Nov 2026 02:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795172279; x=1795777079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+aoykV8a18EfGjtngppAxydVm7TBp0whXeYggjz5TCk=;
        b=YgdH+GeAwrxTSlAQJovC9XdWNFdFhcuaeRbzxzIvOjFguhY2c4xWHyBw7uC3Ne5OcP
         5X6++9PEh8tcvWjQnrzucqYhAws9Yqi9MOEoMk/FnRajLinYVCN7oQ9tyuB3IXU2lQ31
         18w98B9ORXWM25PuYMTHVbeM8YFcp7dv9R0/xNnaNfQ8jYhXSDS3Wkd0Y6SAQdDQM6Y3
         xxMbn3Vvgqy/Nq3Tq+XYvknzMSwk8hjhoh822/tpyJoTxfvteh/DTs1ECa6Nus6jOTmJ
         EqPkVr/9+w7T8EALuzF1keWW8n0QTDq4YcIN/WrH/lY08qrDkU7otKGz/EU3VK1QtdV3
         K6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172279; x=1795777079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aoykV8a18EfGjtngppAxydVm7TBp0whXeYggjz5TCk=;
        b=Zw/rzNpetvBhRgPVpb9i0y0AHsXP7go3lNV36WRbPLvr89T46q4ppr7WSrC1Tfq4qg
         l4v87lLo1pzWRXomfDB71qqk5iOufbX9Xz2cuXvXzoyjA9ebtcyly6MBF7EczTfSS+Wz
         Iyr+mA3LZS0UN+0DP9EUYqTDsOKsKMUcz+M4sZYdT4n5yP/+CqC617aLXQqqf2ui5h0Z
         kinFl3x6H9CWIGc7bHmviZ8fL7YgMNRpG7WKjfkWxAJorsPa+KJX7nKI5ebQBCrpLcUj
         IuwStOoMAQMaA3XEdhohu4mSs+O9urhPKZsLm+98KjzL7pV7l6L+mppjImLBW7zspCUE
         uIVw==
X-Forwarded-Encrypted: i=1; AL+hErF4T9aG0WCkdpILQxql0MMSTneWp69Kyedugi2UgIF9JePhPcOoUoFs9eMBHmBt6r80GayksMc=@lists.linux.dev
X-Gm-Message-State: APuU4Z9M7ItNhaeeCIw4lIqixKN8vKhjWEGK/C34BVOECA1AWfaQ7Lei
	D7Rb3yRjuhejZhX8fEsW4if1/5X5KjOR5qLXFGWZvWULiLXKxMEBEJDO
X-Gm-Gg: AZFdTZeY3cBoohS9wFcbL7CzLrLK018W3cO1zKa0q2Z1jGzxIcOeH/qGEdDCj5bDEyI
	LsPIDF4pmRUo0vcf9yWOaq+ytTdU7KO391R21eOH3L4i0xjGN9NqThmI5NOxUT9ZQ2jqDK8Ll0E
	5cyyMppakj7VXKPdkhW63+uZf3XOi94obQiuqFAGq3tNOzpCLFoXVqX7xe9VbdXqwXVdCQ8Z8hM
	fg9FAaP0uSs0tYFlWctwlBO5Gmh4/RyWQZM8jWK3qQLOgTF/qgZtfQ6OanR90Eexb72hx9vCtPW
	eu1EdJIOBZg2TAjkz3eFMnMRxlV7V854pvTDtx+CWrY9g8+7Faj5AQmGX+eHmgaU7U6pcR7wdR+
	Wihv/csUuWsIVL2C8ps6gqHtJ6apB6bIr+YMqvqk7pMg1DN+sQHgv6KTvNe7VSXKWwDpQZweEKT
	5+4tIkgWh5Q6o288saO9SgYtq20r7Z2j8Y4o6blt84wxonm+/7WYvL6bzX4gkt/Ziek21f8DAeV
	+3U1rigeOiAnXSdfQIrVlu0rUJRP3QSF9jeuF1SQN12tNEBfGYSEEeZpahaGGzhggBTwRqbprRa
	xJFGRq23263zpVHonAfxEY9etmbp9TyjHyw=
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr2596721eec.22.1795172278895;
        Fri, 20 Nov 2026 02:57:58 -0800 (PST)
Received: from ilotus-PC.8.8.8.8 ([113.172.110.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm6126602eec.25.2026.11.20.02.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:57:58 -0800 (PST)
From: Phuong Nguyen <ndp2809@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-clk@vger.kernel.org,
	sophgo@lists.linux.dev
Cc: Inochi Amaoto <inochiama@outlook.com>
Subject: [PATCH] clk: sophgo: cv1800: set mux parent in bypass_mux_set_parent()
Date: Fri, 20 Nov 2026 17:57:33 +0700
Message-ID: <20261120105737.7461-1-ndp2809@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In bypass_mux_set_parent(), when index > 0, clearing the bypass bit
switches the clock to the mux path without updating the mux selector.
As a result, the hardware mux remains at parent 0 instead of selecting
the requested parent.

Call mux_set_parent(hw, index - 1) before clearing the bypass bit to
configure the mux selector before switching to the mux path.

Fixes: 80fd61ec4612 ("clk: sophgo: Add clock support for CV1800 SoC")
Signed-off-by: Phuong Nguyen <ndp2809@gmail.com>
---
 drivers/clk/sophgo/clk-cv18xx-ip.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/sophgo/clk-cv18xx-ip.c b/drivers/clk/sophgo/clk-cv18xx-ip.c
index e936e3154003..34062ad7f2aa 100644
--- a/drivers/clk/sophgo/clk-cv18xx-ip.c
+++ b/drivers/clk/sophgo/clk-cv18xx-ip.c
@@ -588,10 +588,15 @@ static u8 bypass_mux_get_parent(struct clk_hw *hw)
 static int bypass_mux_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct cv1800_clk_bypass_mux *mux = hw_to_cv1800_clk_bypass_mux(hw);
+	int ret;
 
 	if (index == 0)
 		return cv1800_clk_setbit(&mux->mux.common, &mux->bypass);
 
+	ret = mux_set_parent(hw, index - 1);
+	if (ret)
+		return ret;
+
 	return cv1800_clk_clearbit(&mux->mux.common, &mux->bypass);
 }
 
-- 
2.43.0

