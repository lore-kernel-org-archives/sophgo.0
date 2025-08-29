Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65496201266
	for <sophgo@lists.linux.dev>; Fri, 29 Aug 2025 00:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427929; cv=none; b=ZNwRq2FGkKPZn1FvDh87XTkBh0U0KeKH7n6o52i3gwgC/lVLAot5JTilIhpJhiJFBtHLgVx8IjFXN4ojrTOiu5odzzFyGWKU9KEu5cX+mqOEK9qo+PBCRLosE9Av90/rj1FeKqrQHlRbBDG6a8KQVFkTSYzGQhT1ZE1WIHHhwUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427929; c=relaxed/simple;
	bh=lRErUXfhlVyOjMePggfg3EacyZAvSvm+w3vZGvHjG+s=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=FMdSQW6IW/L76bbiSG1dR+tQLjSCCKOkAKyy5nvPL4xx56Q5v7fYpwEoFQFdPGQA/u811Sh10aTEAoy8gFi7zsIy2NPZn7zGhulNkbLs1tu55vimyoBUZUggfEodN/vNlhCBSk24otmypZWLiof29e2sRDTcVCNci1jxnI12E9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MeGgwKpQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MeGgwKpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQVjNKRtGeYd79k9EsHTPhO8iq2mtofexnH8gr3Lua8=;
	b=MeGgwKpQP21PZsdWaN6D4jpcm6dfE5nqwlb54zjGvXv4A9udiMP8hgnZVjYdy/fyHV9ScV
	ixetOv8JQ5HC7jVyFen9wO2Zrwq22Hb49sGRm/MT+uFc8MtehsmMKCkRk0pd7Ld58AnHrM
	fquESkcqppgE1kmjvZqxrbZ06SmG3mY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-v9EyKx0RMVmTtQV-4sd7kw-1; Thu, 28 Aug 2025 20:38:45 -0400
X-MC-Unique: v9EyKx0RMVmTtQV-4sd7kw-1
X-Mimecast-MFC-AGG-ID: v9EyKx0RMVmTtQV-4sd7kw_1756427925
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f562165so43943206d6.2
        for <sophgo@lists.linux.dev>; Thu, 28 Aug 2025 17:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427925; x=1757032725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQVjNKRtGeYd79k9EsHTPhO8iq2mtofexnH8gr3Lua8=;
        b=vK3Oe6OnSe2PagcL4H/cpiOnfPCHBmfRTdKF1LwwPxypLmmo2yPQJAGtAO6zsVHzv/
         sI5MG7kBPvzvao0720e1KJJlj4LdFMS9rPh+vidMC1Y5k1Jco2dBn9u/diRWChboEGvn
         O9VjOEw5/e9zWgsmQ2sHaHsJB4pA01OykTv4hku1q8aLgm75akLgQYj5xrq8GSpuyMn8
         tSJVcqAkyZyCcypjVGeAadQbBW4V91AxxTa3OH8LVwp16M14s0pFGRb25TcKt9z9mfgn
         AmSOu0BsO8vP1gXynTDpSpc+wo54gTkOvfFSu8A0ueKfZJPe+IDk/MuHu1yDEj9j4gt8
         L9MA==
X-Forwarded-Encrypted: i=1; AJvYcCUWiuPj3Jxk+p1K7oxOM8Vra6BgzZSR8lg9U/eZW/5wTZkpy2mxJoAUTtGQJ1aJqmWxwT2Po0Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy70VMgbd7xm+vqHJgmADzkeWF08dxvK8aytJwgIWLgJO43Fp7l
	ldtVpQRPRDtch+NwflH4A4A98F8u/WYwujCgA9PDYkTpWKkcKguwDbaRyVOKlzCY2hZv8VLhXRT
	T2gFeMVqd/ihERTIvA68/HpsWltcVLKUzriwz7mfw5ufY6EKX38FiyD0pBQ==
X-Gm-Gg: ASbGncuffWT1lDNYtmMD4cUu9IRenf5rVkTYFBRuu95i4z6jpILIFdbZ9s/r6aAst/y
	YwGlXO6FtG/dtTNQg04ln396v0SlwpN7fKRQHs+LObGqc11R93t5adgBMlQDoKiTfjGK9Qpeqns
	e69wyhe4aacZY+qBbW2tGj7JpwYnii7axCZmRuu0zDjwCmrIIGVgnoaqT1DiAFBVzwY4oqI+zT8
	boyC0xmh0L5R8EuqRW97cncbmlpZKTma/WJkSzoRn7j7P6bwBVf93fZpDsjPA+BfqH5i3dzQR+w
	b9yQlFRPMAT5I4Oxul0luIjpTEQaqLSnuyiq5SkqlqrR0bB5iBNmDDCou54jq/A460uGbz+Xdlt
	/a+NBrggJhqK1ayNGDnOmNKLyV4sOD6VrOg==
X-Received: by 2002:a05:6214:cae:b0:70e:782e:b23b with SMTP id 6a1803df08f44-70e782f22bamr10926596d6.3.1756427924882;
        Thu, 28 Aug 2025 17:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR8adeLmPp6i8NPj//2LYlvbZ2JGvJAUD70v2I2NLKTSUE6nmwskQ+vGH0x5SgjqCGSE+qBQ==
X-Received: by 2002:a05:6214:cae:b0:70e:782e:b23b with SMTP id 6a1803df08f44-70e782f22bamr10926366d6.3.1756427924487;
        Thu, 28 Aug 2025 17:38:44 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:43 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:22 -0400
Subject: [PATCH 3/8] clk: rockchip: half-divider: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250828-clk-round-rate-v2-v1-3-b97ec8ba6cc4@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=1835;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=lRErUXfhlVyOjMePggfg3EacyZAvSvm+w3vZGvHjG+s=;
 b=77L/EGAGdRYd5Zfk7wMZPiUoUyEJ+wFGI5TKO4e9gl+bXy3dLwkQMeaRO1HRElJrc9TAOKFe/
 f1vZeXk72u/BkLnWKmAly+0tQG9J1VwJ/BPTEXNwrw7PqrQdgLjH3+M
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GzmC-p58BW8eJe-L8JDSD3Uefp-Z7o-5r0pRmhKVEPU_1756427925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/rockchip/clk-half-divider.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/rockchip/clk-half-divider.c b/drivers/clk/rockchip/clk-half-divider.c
index 64f7faad2148f27099d1ace36da45207e2315a1c..fbc018e8afa44c87a5a7b53475fc98b318ce1ec8 100644
--- a/drivers/clk/rockchip/clk-half-divider.c
+++ b/drivers/clk/rockchip/clk-half-divider.c
@@ -92,17 +92,19 @@ static int clk_half_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 	return bestdiv;
 }
 
-static long clk_half_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *prate)
+static int clk_half_divider_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct clk_divider *divider = to_clk_divider(hw);
 	int div;
 
-	div = clk_half_divider_bestdiv(hw, rate, prate,
+	div = clk_half_divider_bestdiv(hw, req->rate, &req->best_parent_rate,
 				       divider->width,
 				       divider->flags);
 
-	return DIV_ROUND_UP_ULL(((u64)*prate * 2), div * 2 + 3);
+	req->rate = DIV_ROUND_UP_ULL(((u64)req->best_parent_rate * 2), div * 2 + 3);
+
+	return 0;
 }
 
 static int clk_half_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -141,7 +143,7 @@ static int clk_half_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_half_divider_ops = {
 	.recalc_rate = clk_half_divider_recalc_rate,
-	.round_rate = clk_half_divider_round_rate,
+	.determine_rate = clk_half_divider_determine_rate,
 	.set_rate = clk_half_divider_set_rate,
 };
 

-- 
2.50.1

