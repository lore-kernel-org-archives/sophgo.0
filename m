Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A671EEA43
	for <sophgo@lists.linux.dev>; Wed,  5 Mar 2025 06:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741156801; cv=none; b=ENWtw/DSm9FPnQaXU8HmcX0d0gU7o3ymyhZ8eYFrc2jVDWkYPADWJNCgpYMJDbokqV3F9XTavRdfxVIlrzzkl1/yA5uA5pTRqRlmS/q9pEewsewe8OLZR4HLd/GG+PZZse4K8jtZNYQWak1ep61oYEHrEmZFWjV6Ythrk+bGnco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741156801; c=relaxed/simple;
	bh=86l/66xIownBaZ3cwYjV2cscKhBS6FrLrokPJGrjecs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sW0IVj9UMxRmFJ+G/n+ifKptZpZDOSAcEEVUC7VfhucfcbILLO7oJZfFY6rm4Y2WBEamvRFofWQGvabt4+X3cFVxthterjrBKZO5kZu6yf19QonyJiSvtzAd6urowA+B/V11QafD807TWvZufjwnEoma5oc/GIMnHZT1uehmcKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4rkdKWz; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4rkdKWz"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ddcff5a823so50841976d6.0
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 22:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741156799; x=1741761599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnUFYilpgj+lApe/lLMUPIRjzjwA/TjaOromIwsEgpY=;
        b=M4rkdKWzS34U6IF7NrMiQqjwUchxBiCqxhwJfwducSsHO6IQCLfXRk07W5+hNXOj0S
         qOPGLF44GrYLBzlFl61tkmyK/1YWFmdGDgcU5vcKmyMqr5YXo0PcsOaeBYQ4aZTGb/o+
         PmZMK2I8y9kOmDw/dTINC/ZHpCXlW2fD4R3UmHmT6UyojgpJV71YWQ/ffSVKpK0BpiQb
         89cprVnA5ZxDa8J97Y75iuPHVGh2/xhjKCExIwFqmI5w81sQgZzz5fp2DirXR6VxWeIK
         T5wv1ND+twK5BNyj5FTThK04KflUixsA4qvF6BZ4mDrcYCxAN4jFf//LvDfBb0Mo4Gbs
         VOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741156799; x=1741761599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnUFYilpgj+lApe/lLMUPIRjzjwA/TjaOromIwsEgpY=;
        b=kxwuqgjhEOZ0XJw/DSbMIiWXIrO2z8KvL+4sGgwH1YEcBko+KZt8X4Jw8EPgV1kU3w
         B+BSGM83e9DY6OLWWm4BwvVwUE/auRL7Wavpqu5qFOZDPfms0O+gO/hn9FMGihcPSsFv
         3uP0SUbeb83dKur1v93hAVxDJdjy1eKe+7l+IDf0YnSjxdhoA3r9/PkVQex+dF8HvAHE
         QDLtNi8cjwmai1LVLMw38DKVtwcZjAaJ0SJrowQ+lxbhogXgdGc+eqTMdR6MN2o9vlYj
         IPyZSmwmh/jQEA+9ftbITnX/XE0wCDo31dateAJjxYjqO1r3nJr6YVV3U5MPOQ+2rWWW
         ETAw==
X-Forwarded-Encrypted: i=1; AJvYcCWyqI+4NW/sp4r822itS8yo6fw5Y21alD0JBAhPkBuZBxQm7mGN4D4Nxm9gp2PYVnc+0ZHhbqk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUtAQjwK6wS/NdTVzaBmn0VKkUnpSdqj1NJEH1EdtYjyE7Dkis
	plDrlzPg+0SiJ0MSIiHD552O8IDGQpOVDi5GYbHJHrW2LCwfoVT3
X-Gm-Gg: ASbGncviSolNhTN/sF8tsXKbnB5LC6ToZwKOCxzN7N85FGTbshmZCvgaNjB13N3DDPD
	t2lf97nbwPGPAvFutskrthb9Hio6thSS7izH3Fdp4jH3h/ND92KToq1ugNqLOA+3fiHdj8jyWCk
	fVoR3D5dzRtGtO+nGdxapk40XGmp49xGN2W90Td39Ppl2cwNjVM+Vgij9wK4CZ5oecvHE7tC3oe
	XOKFIe2wOj5pdGHXb1p0cC/bPQXW+Palr/KNcLdAVbyUbw9fa9PwTiwIdJXDuDX6nTDf47STCz8
	B6q+wohNOaueEvh/Qgw4
X-Google-Smtp-Source: AGHT+IEuoOgEWieVXYXs/BnBGn13ST7tq7MLg2Te/z0E0W/Uw2i3Q/8qgPco6xeoeTBuGR6vTw3lBg==
X-Received: by 2002:a05:6214:500f:b0:6e6:5e21:3b20 with SMTP id 6a1803df08f44-6e8e6da9f4emr26434836d6.35.1741156798831;
        Tue, 04 Mar 2025 22:39:58 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4750aee9694sm7883261cf.36.2025.03.04.22.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:39:58 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v6 2/4] net: stmmac: platform: Group GMAC4 compatible check
Date: Wed,  5 Mar 2025 14:39:14 +0800
Message-ID: <20250305063920.803601-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305063920.803601-1-inochiama@gmail.com>
References: <20250305063920.803601-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_device_compatible_match to group existing compatible
check of GMAC4 device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c    | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index d0e61aa1a495..4a3fe44b780d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -405,6 +405,16 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
 	return -ENODEV;
 }
 
+/* Compatible string array for all gmac4 devices */
+static const char * const stmmac_gmac4_compats[] = {
+	"snps,dwmac-4.00",
+	"snps,dwmac-4.10a",
+	"snps,dwmac-4.20a",
+	"snps,dwmac-5.10a",
+	"snps,dwmac-5.20",
+	NULL
+};
+
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
@@ -538,11 +548,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->pmt = 1;
 	}
 
-	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
+	if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
 		plat->has_gmac4 = 1;
 		plat->has_gmac = 0;
 		plat->pmt = 1;
-- 
2.48.1

