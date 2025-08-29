Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6D1235063
	for <sophgo@lists.linux.dev>; Fri, 29 Aug 2025 00:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427948; cv=none; b=PJQssrFUMyaSz75uVrruf/zERslnOIy0IHIvsl+96nqNj+FQ+OxUYz7G5H9jwYWSEECbd6RLvlycrzWaXNPJHl49RCzuH6zThOFBLDZlka2juGXw56Nj2eo+OB7zabPdceloBJ3sc4wZDcB7A1OmXmpQO2tREOxLlFBw4/+Q5/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427948; c=relaxed/simple;
	bh=58n95bQC3o+Nb/L33jeFcmWnqEOz/8LpB+ZJ4315jbA=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=AwXhT4lU9hzVKdxZn/0xYPMn7AY9eQmaX99bdg31tLqV0ZL9cnQCg4Kjm05e+nQS2un00QkjBfgBcr9d1Asu8XzGlhBcZujegi5KyhW/v39p5+xGhJcHbxTXfUhgXtlK0qVmY6EuA0dbedQpfDmlD4snNItlDqBpO8JpQBGBv0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LrQPpmU7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LrQPpmU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zv3Pf2hNuIQOUArm7ZxnDoNihXiep39POzlD21Z8Ns=;
	b=LrQPpmU7E7DET+x/7Jdb/AzkIYIHXnzbTRiK+MclwYZbsKrd0+zuZxapqEnL1OYaLrS7gH
	QOOb15RqtumicEOkfnLKdFFL+ylUCbSXwdnmCtuYEOszR43q5fAp++zBrz54/TSJEzvXCq
	l8BGc4Nvwz/uzXgi7G1/n/EAdtYEFGA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-n99t84wbPhyX2cB_ieALAg-1; Thu, 28 Aug 2025 20:38:59 -0400
X-MC-Unique: n99t84wbPhyX2cB_ieALAg-1
X-Mimecast-MFC-AGG-ID: n99t84wbPhyX2cB_ieALAg_1756427938
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70de0bdb600so29766666d6.1
        for <sophgo@lists.linux.dev>; Thu, 28 Aug 2025 17:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427938; x=1757032738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zv3Pf2hNuIQOUArm7ZxnDoNihXiep39POzlD21Z8Ns=;
        b=SSN2opYObTIQLdA5RYAnfWpxYiWiU3RHAlQmZwmN8xza1MAD/tVEz+O2Ysoc5Z78c7
         ZXLVhjPi3/wU3DEBeiAB3N3vYkKwka1MqqDpO4he9ylVIWSK1ZDvjpBG/Jt8jEUM+hCf
         KBrsPtj1gYhBd1qSS3sG8nCZgHkxXu31ZxBtdhPqXib6p6pygWNkOWvd5hNHWn+PlfXi
         kDHCzAI1cppWwAyiGh9To91OijhRJjIJYSkS1bYNf0mv3RjJuhGgrr/iBdM9WHLgFk18
         rc9QHo5ln/N2+GFq1kR61DY18WLCVd71fD9hKXGbOMPCgXUe2v67MKt72cj8NnnG5ZBr
         Qv8A==
X-Forwarded-Encrypted: i=1; AJvYcCVOs21ixYddubGbayQwozoFlSjYAJbaiOpQW4JOH/8Yp0aK6SfXRfARn4cjYvsELG0+imYiykE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzcbojf7k07NK5fVfvXNHsduyUIZh7O+7QNvbF3PWNMf4lhtE7S
	OjMtlYsd4qNWzohv6MIZZKYgZ+h41lMHEv2ky+yQ7g5s/nBkWoTI9NKQsZEFmmRJBXp1ITzUt8x
	BjYAQ2J5SJtEA3/RAjvuuStLKvbUANP0urHSLZr7oKiQti+U11E6j/aOa9A==
X-Gm-Gg: ASbGncuLRW55/4roclVmz9cGoW/AmcIujHYEsrpL8nJBe3Lve8fUhlELc/Bp7r4n3XW
	cJUrlEz+uyN9jczgCs9ja/1HHLTISlolv/15Fhy1pIhWvG5iQTtTT858WqVQEoOnvw+kU9Y8fkv
	Ac4NMJ+zlr74Qa8ZEqFeb8HyLbViuvPzaPgCMp9XwlEgW1GabWOIzJS5MZ6X9CgWPhNgFW5D1DK
	7tiKeQKsFMXMQeUMQL+1XEcUP8whaAsn7KjSNvaVm7T4JeeEAWzY4oKEJ/LVoskhhWa3xU57HFQ
	/GieJPkhakHAfwYrL/3f3pNYsJDBwhrOXghmD3CIfyIWdAiS/gZVwOGGeZNp5KtZnh8zfL10FuR
	PPamVq84lOZy7IsQNuYIgr8b6elBpMISdig==
X-Received: by 2002:ad4:5d6d:0:b0:70f:5a6d:a24c with SMTP id 6a1803df08f44-70f5a6da382mr3848646d6.3.1756427938570;
        Thu, 28 Aug 2025 17:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNGUlyT+ctgue+dRAvvl/QvlMdyIOiL7k4jZZ7Wud+MSEXYojVVEBluU8riRrhIojKE6e3Kw==
X-Received: by 2002:ad4:5d6d:0:b0:70f:5a6d:a24c with SMTP id 6a1803df08f44-70f5a6da382mr3848306d6.3.1756427938041;
        Thu, 28 Aug 2025 17:38:58 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:55 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:27 -0400
Subject: [PATCH 8/8] clk: zynqmp: divider: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250828-clk-round-rate-v2-v1-8-b97ec8ba6cc4@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=2556;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=58n95bQC3o+Nb/L33jeFcmWnqEOz/8LpB+ZJ4315jbA=;
 b=uy+XUWiCv9yIjSAyrE0/4I1CLGHob+UIZ+EQxuc1qyVM5xq9Nhgg1+JCuBhoLqxMKDOrEirQl
 MnnF6BAHL2DDr0riIPtjEh4AcWFPyXh0pP1ewj5MPPjAgu3gyCxOVpL
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3JPAdoB4X8NIcNHhNl_nkHiIz99at8-LHV4C421X1IA_1756427938
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/zynqmp/divider.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index 5a00487ae408be4ffd586704859b232e934c1f6e..c824eeacd8ebd4d670d78f1af2186e61008bdae2 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -118,9 +118,8 @@ static unsigned long zynqmp_clk_divider_recalc_rate(struct clk_hw *hw,
  *
  * Return: 0 on success else error+reason
  */
-static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
-					  unsigned long rate,
-					  unsigned long *prate)
+static int zynqmp_clk_divider_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
 {
 	struct zynqmp_clk_divider *divider = to_zynqmp_clk_divider(hw);
 	const char *clk_name = clk_hw_get_name(hw);
@@ -145,17 +144,21 @@ static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
 		if (divider->flags & CLK_DIVIDER_POWER_OF_TWO)
 			bestdiv = 1 << bestdiv;
 
-		return DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
+		req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
+
+		return 0;
 	}
 
 	width = fls(divider->max_div);
 
-	rate = divider_round_rate(hw, rate, prate, NULL, width, divider->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       NULL, width, divider->flags);
 
-	if (divider->is_frac && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && (rate % *prate))
-		*prate = rate;
+	if (divider->is_frac && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
+	    (req->rate % req->best_parent_rate))
+		req->best_parent_rate = req->rate;
 
-	return rate;
+	return 0;
 }
 
 /**
@@ -199,13 +202,13 @@ static int zynqmp_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops zynqmp_clk_divider_ops = {
 	.recalc_rate = zynqmp_clk_divider_recalc_rate,
-	.round_rate = zynqmp_clk_divider_round_rate,
+	.determine_rate = zynqmp_clk_divider_determine_rate,
 	.set_rate = zynqmp_clk_divider_set_rate,
 };
 
 static const struct clk_ops zynqmp_clk_divider_ro_ops = {
 	.recalc_rate = zynqmp_clk_divider_recalc_rate,
-	.round_rate = zynqmp_clk_divider_round_rate,
+	.determine_rate = zynqmp_clk_divider_determine_rate,
 };
 
 /**

-- 
2.50.1

