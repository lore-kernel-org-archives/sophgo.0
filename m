Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC2C27876F
	for <sophgo@lists.linux.dev>; Tue,  6 May 2025 09:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746524010; cv=none; b=d9l4z5ORegrtpc38VD0nxl+UOCxoq15TPG6KhXFJl25X9owOyDrfybmTTBSXB4MiL20x0LxpDnL4cTHWePIs2AL2j4saeSPowaGBDl/sCCBVhj0+qLdFJ9hNxE+S7pdg6SsYt3bj4DGyvV97ZfRQZTfBLwfgBD1GF6HCwI1sErA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746524010; c=relaxed/simple;
	bh=YVsXPN6IEiX2cI9KuGIy9pGdPaxV/V3RMgTbI0KVoqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1/M+xqZGZgxuACmCtpzKhixpyzlNPbxGYC/vyTUPwf8vSPAIqFnirZ1HO5Rnlw6dfs4jH227ACQ5hec12ZO3oPws1b3PQ2AC8+FWRUpprqt8Lh4cqYQHR/FChIdlNQzpfIa5Fe0QKlcHixCd1d8TuA+f5crqFcSDwNuLWpaXsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFCqW8qi; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFCqW8qi"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c7913bab2cso580359485a.0
        for <sophgo@lists.linux.dev>; Tue, 06 May 2025 02:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524008; x=1747128808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUQlHE3WV+AglG3E1dueIGqmAdWvRG/aDbQh6p9Pats=;
        b=gFCqW8qiuqLMHfWreyf5caZDtPQR32eQV8VPY0ZEQm0KoL/T7LNam7a8rqDmgNTgXz
         6SWB9pqlvxegaSZfhyRg1W1I6WcOvW9JWidrIJMGfnHkpgCgXM+0Tum6/kGVw/rEg1sB
         LiPsMADo8xrQk/rWTNSoC/IuuUYv9hBEcEcgfii8fntfIDv6GlIZdNZpzAde0f87L1Q1
         bvc/rn3VwMkqmwk1UPIIKV+tRpeDlK6H8EqN5T7pICORfOIZK9RUEhnnoOqJGZ3VMht1
         3dllC60oYXM65LuwB2xSLS0b3f5PaWjSyrqJ36wrOfs2yoOwenRAqgl40KqYQV1ToRSs
         ri/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524008; x=1747128808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUQlHE3WV+AglG3E1dueIGqmAdWvRG/aDbQh6p9Pats=;
        b=hj0pfjTmtjnQUzed/Vc0UcQ3EKDy+jOKy/bSUzrt5vi46+kbQYWeCugGQM7qKMlsTQ
         1Nq1zK1JxfCnrkA46f2BSzuJsRv7R71KrnPT/CUIK4yIr9VryJL44gUWjGr68Tf+7eWb
         GcpjheqV8l4WMQksSzs+f+m1nWKH/Kbh48DbbncBUFoV3jpzFs2qmlIaEvIEff0bhUBa
         AfBQH/JrEtsPtK8NNG4eX45UDjwhuQdTDax78uYa3PRCOqloycNq95qK0OLsYiywku6C
         StpmdeL71WL/5JtdExGo8v+FGepYARHPulW4qv/4bsojHWssFcyKlnN/WWt2fvxyzEer
         loTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc5+QMZ4PvvewU3r8dxIc4klOHYb9lGz+wgjQ0hxeXhkRy/opsg4iCchuzbfTzQnqGBJjgHFU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhtmhNXzsoTjyGYo1Q47UXbuHE3S/U2Q+lZ22N84wHDENfqRRt
	7PFDLuOloPDO6fJMyO72nvzyBjqkk+X7CpD20hLDD/mjrN37uNQP
X-Gm-Gg: ASbGncuTbm3J9pdHBLcLnqpyin83s66VX69TWoIgXEH3bOWMRbRCF7It1q8eocVMMAz
	Y6fMAXARWjHEhs4/S32Uo61yMiLflYVN94RcZ5590+GzEHgFLrNNpQCdxpldyen2KRZl4sD0ywl
	JMfuYpfd+nGRV1SjGJGcGaHoxET7CnfCOJ4iyT8uRNqqGTGWsPE+xcHEVlFHk9EvMY2TATvcwYl
	HMI7WWeDSybwGq5ehb+XKJYXgPJjcEHah1t5+zl8jrnDy45xL0Z1yFlz1i0ex/HhwD4/rpNs3JY
	ZE3rfmnmrwmSnEgS
X-Google-Smtp-Source: AGHT+IH3VqzXlInrKha6VmM4WZWfAGkLbfKCYjNCx8kJZ1aXhqv2kgptMAcRo1MHkN1XMG29piZ9jA==
X-Received: by 2002:a05:620a:2549:b0:7c5:5d4b:e63c with SMTP id af79cd13be357-7caf09d2a28mr363658985a.47.1746524008194;
        Tue, 06 May 2025 02:33:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad24501f1sm685744385a.114.2025.05.06.02.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:33:27 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH net-next 2/4] net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC
Date: Tue,  6 May 2025 17:32:52 +0800
Message-ID: <20250506093256.1107770-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506093256.1107770-1-inochiama@gmail.com>
References: <20250506093256.1107770-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds device id of the ethernet controller on the Sophgo SG2042 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3303784cbbf8..3b7947a7a7ba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -54,6 +54,7 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sophgo_dwmac_match[] = {
+	{ .compatible = "sophgo,sg2042-dwmac" },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
-- 
2.49.0

