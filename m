Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DF81F418F
	for <sophgo@lists.linux.dev>; Wed,  5 Mar 2025 06:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741156805; cv=none; b=gDXpqbH2qMafHLHZVLPXLBFqNF+9kTX5XjVyVZtTJZ4JRislk2hZSms1LHkZhfCsD9kkibtsrt7hbjRzIyinVaJgy6Ewav+KMd8mTEF/1Dis/DW9ID3mxI7DLOQC9NBFBFrDhFQ4BdS0f90h0jo2Da+zHnOF6aGxKTaGXyFd8JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741156805; c=relaxed/simple;
	bh=kmVtyRIsp60GI1eJ+DXHiPcXJHc/x7HJlATseKAAuY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X10jjnlKkWwjEeywaHCkO0+c0V+sf/SSX3gjdo6G6WxCj8gnU2ODekXOfUD6IwEjgeCiUzvkg35iQP2cwtaoNPo5v+sIvY9htpWrkhnT77PX6URXYUYAM+dRvGTmJi9euXM+PsZameIbJAiHC8s5XET5pcOHWKQIXgQrJKvVQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCJsCHF6; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCJsCHF6"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c3d591e50aso136606385a.0
        for <sophgo@lists.linux.dev>; Tue, 04 Mar 2025 22:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741156803; x=1741761603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nls7kmdirsxklQsEsdMD6n3p+K9nTnYY1CAEZgsVHU=;
        b=DCJsCHF6K1hRD1qgIA3N6ZiSa03OUaaZKcZdM7B+QRWTPkR5z3GvkmZNqNIcjROAQ7
         m8xRSwZdpseb1YDd+pWlBkFbRtqNgO5GuD+gEO/GGWldO1Jd+xwz/T5xgbK2nyEXdtv6
         B/rtQRQpjECDSJdpJIOqPZC7fhr+oTnzo9Yu4LDKy/hpehrfwtrsbHn8tiYSrqDl/+MG
         rdwXa7UcrCejBcAIdaGI8V9mG7ZvB9up5IfVfz8wpI7TkeKkWqlCE1OPUEDNMj8ha4IS
         JRXcej52Q2AmPdaxRsbiuOmd/y8Mn+uAl1RNMnKFP3royC6uljB7S6k+ZJo56fFP4rOU
         PF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741156803; x=1741761603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nls7kmdirsxklQsEsdMD6n3p+K9nTnYY1CAEZgsVHU=;
        b=Q8yk0VBPE9s3Oz2JEhaM8vF+J4q8qQwh7I3y7so9rEoHcaOF6REiiTxSmLPYlnnFy/
         JIgheYdBN7rr7ME77sZObluBpr6kK+YKZOBZj/RWh2PrZqQ24rFQtfBzdZI/Q/EHN0rg
         PRqjV0xhCGuJyEM1f16ztX59fpPfFQmS+FVbVQ4j97b7p27Otacopm5pLOodu6b4ooFk
         OSrpICGg+qbeD6qs96IyLtaIa9dN4SptPPcLdTx4N+jVU3gYOmFC5PWK8tgTnjSyMQhG
         1ooMK9zw0xPi6Oa67OfWhOD5rI4NpayfrQ4oy4RRLj/ZqyVVw0ADPuyozWehLM5+8Pk9
         8P2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUd8ujbZh/g6PyuZ5sFL+oKn6+/+KdS1OS/sck2kHoQpPf0ThTWb2HnUPvSt0Z6eK87TkmmpsI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMLNayvbfTBcTyFw8WaRjimofLW3WjTw0ujlN7eNAQiujrD52a
	f+DExCbrENO+Df6Rv+S4r0R3Q3veKEYvvzCCqBrV+1ZE4w7kYT0w
X-Gm-Gg: ASbGncuWvd/WjyV8GIIju3amgp9CojwVZ/1mtChOsQT+1Vos4wXUCRi1dskqFWX5RpF
	Hn1uUlQhHkVgC/B8CtLp1qrh+WAsIbRN7PthwOw2Yaqv3HVkXDfPeMmkOSMA/zpBAwbxSEq9qnr
	J3hSVaxd0ZYTN8aSznwmVJkjX6F5h5EGBey/R/vTcc/uWyKyKdj6b6OvpwJG/ebmTb7MblHt5r1
	dinWgr9sWCGyNF59DarhXNL8iVXSlaFimTq+2srnW1rVhyGs1VqSfaMetVrCxiRwp2eIYE0xj1T
	+br5FpPvmwW9RQADS6b2
X-Google-Smtp-Source: AGHT+IHvjwxT5WbMC7jnX9jkcACdhgQLJENaJZs+PW3Nv5C/K/7SkZFAn2aK/Z5GNbzrtFbbjPi8Rw==
X-Received: by 2002:a05:620a:6288:b0:7c0:c2d7:5f2d with SMTP id af79cd13be357-7c3d8e7b411mr307853585a.28.1741156803205;
        Tue, 04 Mar 2025 22:40:03 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3b67458e0sm409029085a.57.2025.03.04.22.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:40:02 -0800 (PST)
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
Subject: [PATCH net-next v6 3/4] net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
Date: Wed,  5 Mar 2025 14:39:15 +0800
Message-ID: <20250305063920.803601-4-inochiama@gmail.com>
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

Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 4a3fe44b780d..8dc3bd6946c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -412,6 +412,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-4.20a",
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
+	"snps,dwmac-5.30a",
 	NULL
 };
 
-- 
2.48.1

