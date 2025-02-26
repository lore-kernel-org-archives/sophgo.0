Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADAC2620E6
	for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 23:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740613390; cv=none; b=Kxnhg+ryRhkp6POwcVsVLFoBu6R9mqSgSO+8dgLSXroFfsI21q/KAMfiin/ThAIt+0lPT6d+6MeUSbps1aVLhf3Gxt75o2uYfX/etO6RxI1jnvnbtKfdcxy/Td6unmd9jHVrIzTuAdZhskn9CiBPxoOlPwuJ4eIU76ozxL4Azlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740613390; c=relaxed/simple;
	bh=dyuuxAMJmy1jUNq2vusCG8A/JEHelnf2zIDJsSHAoYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtTqLPa0Ld5d1+T19utDJS5+ysalrsJG+aVrW7o6SGIjPoyI7x8QDJG6ckpqjnuftCANKi+C3jRBY/w7ixVZ1NHi/pdyPAxIUGrQap8ccDcGvPnFrG/BjryK/TnjeUEmiKh9FCzBpcaKU2P9mCy1T7vnJbKUZ6glomT8Z7D4m8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeGvLML0; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeGvLML0"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c0970e2e79so66707185a.3
        for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 15:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740613388; x=1741218188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3ZZcc6aFlJ+Kl9Jw+kBevA1072SNgIuZeodxvN8Etc=;
        b=LeGvLML0u3eRXQpouE7kpKRrz9i2wwIqFGoyUqSPJ3+ON6mbc4K3Gf0dru/QcoDhG4
         NQZsqMGB8a0/RvXEq/hb0Dq9q0uXnQGRDhmrT8bnAA8WApgCaIkn4I1zANptfje0Xu4C
         5HJQ54+hdu2X7uUfQUxduA8qasTWUlmQhb3mR8EMXjhrJ1KmRAFY0AA/T/rRXsbXRxyg
         v97pie/pRDUwVvYe6XhQjxES0KXqy5PXCsk0VRynudgdwfz4xu6ZvZVQjqcAgnz9JxW0
         0fHgaEpVz6sz05waTr3jHmm6lfeGglXhzZvNrd+yzIdTwEYS8foQefpQQW0QrAmJM84R
         YLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740613388; x=1741218188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3ZZcc6aFlJ+Kl9Jw+kBevA1072SNgIuZeodxvN8Etc=;
        b=eLG1JwRbcj+izLXA94nO1IsMRkrj0K7QIAARHJ23OanOzKWBSukbxnBETOl2atxUDj
         EwALwvfOsp9GMPrZofIYXq5uzBlVCJinYwIVdJ82OEA4+s2LfAgrXp4a17oZgUwIPgG9
         xnITRNNkDoH8tXfZSzO6IFOoO7q5vUh6F/YSctr0jmSnrmiHRs+31SbhKLhRnsaAduUR
         3j7PPNDtJUAWkNhziEZlzWSHXF13CIXOHsYvB4W0tkI8rHQ5rRBGe6um1IpIM4e5VH9B
         D1faaU2gqoabV6GszzeySRMWI0lg+0aoulomQV9Q05WCx/OdnzEs/FHshPxhojfwI+89
         /zYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Oq7zLFcmxtmh5tcCUFWnMhA+guEa5lxpLzJ2DBcAmyOAue3OehDnD46woe8Ssa9tfJnzfhQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcK4Ax/7HgrC2Egdiv+PqUfOON4PZgaJT7UXSlUXeb4P+5Pv1G
	4TjR79/KOXs9QkvYgMwhSHp1+EyLY9GokBbIjabCAJxTDrYg6SM3
X-Gm-Gg: ASbGncvdkjk2meuP4lkFO4/H4zAsmLVMTU9zw83SjDEZqcBNkehnDa4maIYN0UGpoYe
	VlUIr3AnjX5ljpOnRihaQf1y39xXtYHMcTonRX0+worlfGl9gk233ked2JUX4jlfToJLDDS6EfS
	1dZnOHo/NR5L1V8nq+ox8y+2ERWKnqlfMVFtRspKA5sZRV+fFwgkgzm9aWCc7kDqfO3uwULa4Jf
	yL4mYm2qwsI17c9L65WuaXNM3KsXzF3lKGnCc4BhBxgTL2YMqf7p7Wl8V8zYFEGGXUCGM0PT9bp
	5w==
X-Google-Smtp-Source: AGHT+IGD3BiOa/Df2rVPvpy/tGOHarw9GjKQY9DsMSLrCoKOy4FTIEiF7wxb91QFop6oTXwxGEZsUA==
X-Received: by 2002:a05:620a:24c1:b0:7c0:a3bd:a779 with SMTP id af79cd13be357-7c23c04868amr1554444085a.47.1740613387864;
        Wed, 26 Feb 2025 15:43:07 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c36ff0f756sm24200285a.61.2025.02.26.15.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:43:07 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/5] reset: simple: add support generic reset-simple device
Date: Thu, 27 Feb 2025 07:42:31 +0800
Message-ID: <20250226234234.125305-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226234234.125305-1-inochiama@gmail.com>
References: <20250226234234.125305-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for generic bit reset device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/reset/reset-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 4b08f8d70942..0681f2db7459 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -149,6 +149,7 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 		.data = &reset_simple_active_low },
 	{ .compatible = "brcm,bcm4908-misc-pcie-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "reset-simple" },
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
-- 
2.48.1

