Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4F119F43A
	for <sophgo@lists.linux.dev>; Fri, 29 Aug 2025 00:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427940; cv=none; b=VA8nfhx/007UTonuAXD8zAB8EAcy70/Uv4Y0Gkc7nQGICqfkVLy9N5OJf4WeI9NT4HlOvgLdV4lnJpOGbj7QSRdLqW+amDIWa5/9k9maHohOUA/poZd7GQihLnSCTmVLd+wUyJclHF/pChJry8ZPZViyDXyddZPA+jPnezrVc6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427940; c=relaxed/simple;
	bh=WJxAzEZ/y8gMiDjK9rGa4K/3JOojl4uHZ0X5uecFxfU=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=fIYU7aQkhMW4QFpxrY19iMZdTpZNVPOeGPzyOakonUTgBCsKGYZiq1WcKc2AjRzGUYt0AsQgmpmNypSrMM6wd7AtmnPd/XNDA9ZSm6BhvGGYFgk7ndfUghJy4gkdyMVzgWZfdS0b1ufSIqxXaIcAeDAl/Yf14Ifcao/h32Sa8Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KAut4dIs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KAut4dIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dhN2zcFUEER4o0mfl+Pf8YKEeY54fmHrDhnJHsDDNpg=;
	b=KAut4dIsJZ+L8rjcjn91zhxYgeEUBOYlBhmkMyuF/NWwuppZ8Pq5L36CGO9YcZXX6NFZs7
	Ty5oFmgfsJc36g+uh1Y05okrbegLgNKmMnP/tuApBRJ+3ouXeCaSeUliCgefudAzrpV/z1
	wbMMnIYFtnywwpKvMVY0LJ9/rhkKIsw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-ktR3NhepPnScSK38k5vVcg-1; Thu, 28 Aug 2025 20:38:56 -0400
X-MC-Unique: ktR3NhepPnScSK38k5vVcg-1
X-Mimecast-MFC-AGG-ID: ktR3NhepPnScSK38k5vVcg_1756427936
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70f9ef271a4so834056d6.0
        for <sophgo@lists.linux.dev>; Thu, 28 Aug 2025 17:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427935; x=1757032735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhN2zcFUEER4o0mfl+Pf8YKEeY54fmHrDhnJHsDDNpg=;
        b=sS/90QN/A1xj8inWKQ9Yuu1Fhj/jzGsF7t71GguTzBbliZF80jw2KY+PBqgPqH45oC
         z2i1hLNg1MLWTIrTxdjwnVWWUzPkkdbdRxNzECP1DnkTc7+QwGNZ6VZ9t1ZNRcgkR1JF
         fc4gjVNdnvZ5cVz5nK4b3zCUZXG5zHvsDzXvUufZkp2RMpJwLrF9BSB1mQAg1a6sN8uV
         IDfKQv2xvDpYipd3EY5d7hamMSnkxIe8b8wARr2Q6i/O5S6rxlYXwk20v4QZBnLwyuyz
         0qpjaCIrg0DXNU/M9EUy6P56G1gja/YyJm0ZxH+CCFP9o0HSt+dRQ56Gw8wrg7IX1d0Q
         bnLg==
X-Forwarded-Encrypted: i=1; AJvYcCV6LAA3qKyw9t7d7QjYLgFAxDfmQPDDaUxwHz+8YqpzYYUkrNJrkGK/JnMYdXHRFykZ7DpZMi4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9gbaz6+OosaRkAMdQ7spUrl8kAPMiRGqL7u4UD/XwQ7v70irl
	Hd1JDwlFDDequBUL1FMyFD0tROwhj1LjNtdH2MPcsbQxFSTiMSrOd1QwlGFOVNit44pc1KhSKdA
	VCue1vojpkKq+htOvLrH93FieWhLOk17sqAa3I3l87jvYcC6BRiG1hig1f8VzwkoJUw==
X-Gm-Gg: ASbGncs8BnHuVDzHvsrp7Uo0ixmG/ZSF2jIeak5MLpXd1+Vatu1feNU+MvlttnKigP5
	3zx/zGe32t3ZV3ClqAk8Q6s5vQPH4wg2tGeiwGBV3dE5/dFcshRuojBAa0FO1poGq/KFa6sAaGj
	OgUEK3bU7os5I4oykwuLQ59b4crO2DyHpuO9X5GOylbouUOmoInAWKEdjwGk/6qJu5uFY3Lfa/K
	Q0s4/qcJBafhD21Bod39LwIrgbMu7ytq9ir4AdVF7c/jRHlVTVWEeraOscetpEgUB3P4PQzJIyK
	3MEBxQU6y5b9MmsUuPzyfjFXFs3/SOwwi75m1DFohvcBVbeR7veIHkQtrFLJtj7Dyvrx7KlqaXl
	S8Wb87qNf872DvF22Dh0IPKHTjjHeSM4Ngg==
X-Received: by 2002:a05:6214:48f:b0:70d:fd53:7256 with SMTP id 6a1803df08f44-70dfd53763bmr29827696d6.3.1756427934556;
        Thu, 28 Aug 2025 17:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEijYzk7GkyvAnuURsnBocI4vkkc9uguNYcxLJSHaK49JimJzbCk2zB1vtZtqve+KQwqSmw3A==
X-Received: by 2002:a05:6214:48f:b0:70d:fd53:7256 with SMTP id 6a1803df08f44-70dfd53763bmr29827556d6.3.1756427934193;
        Thu, 28 Aug 2025 17:38:54 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:26 -0400
Subject: [PATCH 7/8] clk: x86: cgu: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250828-clk-round-rate-v2-v1-7-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=3470;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=WJxAzEZ/y8gMiDjK9rGa4K/3JOojl4uHZ0X5uecFxfU=;
 b=FRh6Dtp6Qu3xMrqG77h69FKmubrcLmD1DaQdhlvkUw0E6UlxV5Rv3RQ4Eg7iODuTrLGqcr72p
 gQO+ywq9rn/BM+b5lX8Ga2Eu2EAvxju51YKn1XwPasJWhPgQyJz0Qba
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kTJBmPKEg4DeLVMi0Wd4z_iFofEarxdxBx6b1S0gla8_1756427936
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/x86/clk-cgu.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/x86/clk-cgu.c b/drivers/clk/x86/clk-cgu.c
index 89b53f280aee03b7838e4656eae3571f00eaa263..d099667355f8d80785b0f43097ad10c274dd61ea 100644
--- a/drivers/clk/x86/clk-cgu.c
+++ b/drivers/clk/x86/clk-cgu.c
@@ -132,14 +132,15 @@ lgm_clk_divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 				   divider->flags, divider->width);
 }
 
-static long
-lgm_clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-			   unsigned long *prate)
+static int lgm_clk_divider_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct lgm_clk_divider *divider = to_lgm_clk_divider(hw);
 
-	return divider_round_rate(hw, rate, prate, divider->table,
-				  divider->width, divider->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, divider->table,
+				       divider->width, divider->flags);
+
+	return 0;
 }
 
 static int
@@ -182,7 +183,7 @@ static void lgm_clk_divider_disable(struct clk_hw *hw)
 
 static const struct clk_ops lgm_clk_divider_ops = {
 	.recalc_rate = lgm_clk_divider_recalc_rate,
-	.round_rate = lgm_clk_divider_round_rate,
+	.determine_rate = lgm_clk_divider_determine_rate,
 	.set_rate = lgm_clk_divider_set_rate,
 	.enable = lgm_clk_divider_enable,
 	.disable = lgm_clk_divider_disable,
@@ -487,15 +488,14 @@ lgm_clk_ddiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long
-lgm_clk_ddiv_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *prate)
+static int lgm_clk_ddiv_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct lgm_clk_ddiv *ddiv = to_lgm_clk_ddiv(hw);
 	u32 div, ddiv1, ddiv2;
 	u64 rate64;
 
-	div = DIV_ROUND_CLOSEST_ULL((u64)*prate, rate);
+	div = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, req->rate);
 
 	/* if predivide bit is enabled, modify div by factor of 2.5 */
 	if (lgm_get_clk_val(ddiv->membase, ddiv->reg, ddiv->shift2, 1)) {
@@ -503,14 +503,17 @@ lgm_clk_ddiv_round_rate(struct clk_hw *hw, unsigned long rate,
 		div = DIV_ROUND_CLOSEST_ULL((u64)div, 5);
 	}
 
-	if (div <= 0)
-		return *prate;
+	if (div <= 0) {
+		req->rate = req->best_parent_rate;
+
+		return 0;
+	}
 
 	if (lgm_clk_get_ddiv_val(div, &ddiv1, &ddiv2) != 0)
 		if (lgm_clk_get_ddiv_val(div + 1, &ddiv1, &ddiv2) != 0)
 			return -EINVAL;
 
-	rate64 = *prate;
+	rate64 = req->best_parent_rate;
 	do_div(rate64, ddiv1);
 	do_div(rate64, ddiv2);
 
@@ -520,7 +523,9 @@ lgm_clk_ddiv_round_rate(struct clk_hw *hw, unsigned long rate,
 		rate64 = DIV_ROUND_CLOSEST_ULL(rate64, 5);
 	}
 
-	return rate64;
+	req->rate = rate64;
+
+	return 0;
 }
 
 static const struct clk_ops lgm_clk_ddiv_ops = {
@@ -528,7 +533,7 @@ static const struct clk_ops lgm_clk_ddiv_ops = {
 	.enable	= lgm_clk_ddiv_enable,
 	.disable = lgm_clk_ddiv_disable,
 	.set_rate = lgm_clk_ddiv_set_rate,
-	.round_rate = lgm_clk_ddiv_round_rate,
+	.determine_rate = lgm_clk_ddiv_determine_rate,
 };
 
 int lgm_clk_register_ddiv(struct lgm_clk_provider *ctx,

-- 
2.50.1

