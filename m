Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F678F37
	for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 02:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739412561; cv=none; b=PDKIHK/zrxKoMVRFS0ypW2PosmFRovgEIVYrBcRQARn3/CgUQVAKOIq/giohdjgD30V2Ks6upFm+JsSZ6gnp37sw+jAOl73KXBHAAdiZJiYJRpJX3RjHlSN5CCFMc9m7IjfQYHz/3WpSEmtR9xg6o9bDaKjDyW7onQZwOGZvaQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739412561; c=relaxed/simple;
	bh=nS47DlaRDUQh8iykcHA+QsKrWOjDhkLjvofTGBu9D0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7zBSaOJgU9ZNEimBP+z59QMjbHqmVlJpxdfMvWMxP7SOTGTul+fACwAkww06YgKz8ZBoF0CWokWfC2sZecwWSBN3cHr6WBVi1yjU1FHKa9vf+KNRP2j56D6V6AuzybuCwPoxB+fbDgAUCjb92i3q2pTzC4ll5LQiDvr3yS12XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kg6tAzRC; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kg6tAzRC"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e65d6e1f12so2217526d6.0
        for <sophgo@lists.linux.dev>; Wed, 12 Feb 2025 18:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739412558; x=1740017358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJwmjznjyY0FbBsGwbEfQueE5DfCYZR8yX3zAlCe4RU=;
        b=Kg6tAzRCixL7AhULEB/r/mpBLk9REcwYSX0mnZFqEV25Z89r/zq5wFVqPPE0y+fDjN
         8xp/yY7MSpXVTAuPz24E3rmkVRQWpHEaHeY2cSSC9aXYzPUY8j6DhmR7HHQsaukrQbat
         8MbHf22lIxu4fE1iQx0obRhkaN9vgGB9mHcUbrPlB02jYUFj+Dmee0+J+odqw7t+mA4/
         NP7itS8WAkG60UT1OP4h+F4wT9MOJoMhrtJx4i7aNYs176tCYvQv3LX+xWaxAarpzDII
         adiGpgbc8RRLjlUuBevQ3dVMKFgAXKe0ZGuEzz8H4CpviCXVg+DiVmnUVUxefUSyfwNC
         QkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739412558; x=1740017358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJwmjznjyY0FbBsGwbEfQueE5DfCYZR8yX3zAlCe4RU=;
        b=o6tjZV6p57nGrZmDRl0BLKUs006WUwE5V1wBFxs0c4A3WEQbcGHV8qnjpT45iGZLTv
         7ZwDzCen8WvYjEV18U+NRqd87dMFhH02DL37zQMtfG7ljXpgVT+I6q6Hqq2w7d0HNOrA
         eKcW5YwYiX1JhsRQ+P+cXhSld4OxU5F6qAQGFP9zgZZymW91ZDA5U50ufMzLBxgIPzoE
         Qn9BwWaH8jxSq9Y1yzW7T4nobp2A/xAO+AQNh/srgWiQTOlWgZLFhGVoO0P7XiAzxqrW
         sCrsfHL9Zx1nlMU6fz45ehPCsbDGFbP2JOPzNl5mnuQXC0SGrC+QRiyeLnIEcI1NW/70
         3PYg==
X-Forwarded-Encrypted: i=1; AJvYcCX8NfdM12Wun2p8EtqU9trUb7fG994vPZkJ3pb8DHv9EgS2IShlJy/n3C84jb9qRurBO72Tbx4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4tj/nTOIiVhiyMajFsf73O/iyGjwWmlYDiA5w1SAl3omNZdDB
	CmBfv61KVFMue3yaC7iYbIv0xWYnpVfE9aZXIXsRh9gNCKpa1/YT
X-Gm-Gg: ASbGncvwwupH3ptoAJNZoldx5WVII7y6l2lMRoJzH33HvNpq2hPCz3e8fGtC9TH5Bc7
	FkAJeNytGu0EJtszqzFJjOULo4XxiWUOUUWysYITE92RjubALXCEyiAfKOkk5z8bO9fbMKwmA7Y
	5IkW3YB3hmSiK2bRnYJdFBAd+tpXDWO7vXy+y+wy7QaLsAplW7XMmSSYyCjyjtRD8BOQp56yQ19
	NjVbVAK5GXeFmpThjzzXUDxtX2tGrpGjrO0/QP6jm1iIiRi8umOaHZ1eatAR57W6Fs=
X-Google-Smtp-Source: AGHT+IGmj+oM47tfcJcPNQ8fw1vpHd2JW2ApUYWw/rZfMQyrEUWN3vtTcOqHh/Zum1ZuC2b+S4ButA==
X-Received: by 2002:ad4:5ba8:0:b0:6e4:4484:f358 with SMTP id 6a1803df08f44-6e65c150e61mr36705926d6.33.1739412558648;
        Wed, 12 Feb 2025 18:09:18 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d7a3caesm2558026d6.54.2025.02.12.18.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 18:09:18 -0800 (PST)
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
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/4] reset: simple: add support generic reset-simple device
Date: Thu, 13 Feb 2025 10:08:55 +0800
Message-ID: <20250213020900.745551-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213020900.745551-1-inochiama@gmail.com>
References: <20250213020900.745551-1-inochiama@gmail.com>
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
 drivers/reset/reset-simple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..a24f8fcc6a06 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -148,6 +148,9 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 		.data = &reset_simple_active_low },
 	{ .compatible = "brcm,bcm4908-misc-pcie-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "reset-simple-high" },
+	{ .compatible = "reset-simple-low",
+		.data = &reset_simple_active_low },
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
-- 
2.48.1

