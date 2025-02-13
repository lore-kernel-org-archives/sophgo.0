Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A6C1865EE
	for <sophgo@lists.linux.dev>; Thu, 13 Feb 2025 02:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739412568; cv=none; b=MmZdlIJIN2e5//A6q10SMZrLd6vqm/YoH6GTFl43OdlxogFmiSXtjEWj4+AMGsA8eROS4kIrrquOYNWTC2zdk1XTAFzy4DQJCPpr7hFf4O4LxPKjh1/y69wdc0jthF0fF/XoC4RsvsPaeII9RZ2gUfljnjnxLax1HmyKbZ/WXRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739412568; c=relaxed/simple;
	bh=NhnUO4VY33/Rp2hlD9lZ4FgNTSiuFYdXBAK1PePWIuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lshY1RtVud1PIEBQCiO7NH2Oc2SpQiQl+wKH9idoJkFf6ENdTz3/rztXFlw5W6JZalhVVmvGRFmNjpbWxFqDJImhWfhmnL0j1hSKwdOKW9h6K49vabN82j7cZd3FhgAsLHr8N/IISsFHgTw6IHcF3G8qx3ctnahhbJC8ZnRDlVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hP5gkeo+; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hP5gkeo+"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c061d7bad9so30561285a.2
        for <sophgo@lists.linux.dev>; Wed, 12 Feb 2025 18:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739412565; x=1740017365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtFDrrT3rCYjoOZO0OfQ9Vc45JJv/q5OCfIu3p4OZZg=;
        b=hP5gkeo+RMc1tcnA+ty8xQIW8utBazTanOWeMjziKlp2UqtPg5UXN/aMySLzIAsRHB
         yC+LCK3fMouyNDJeVOyUI0MOR+qkfovbWIi1IIgOG4ApCcfVPw7pmLTEQw1CjW4YBxyu
         bpFpIEYG/I4vEcwf6VORoCoB3FKaH8bZaxOtjJiMrtEXAbyl25Sur5KoT18EwUz7BUlE
         MoJe6HtBatCgKpGytvP2QZGzzqYab+6oNs/H2lqg+zFxY5CzbFizzFyuk5CU7ZSAxbNK
         qp/Vw9EIaPCQQDyw8PRSxns4tSf/iZD0aBUQEWZvjqdPBfioCwtcpenxuDzePGPzlzDd
         HgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739412565; x=1740017365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtFDrrT3rCYjoOZO0OfQ9Vc45JJv/q5OCfIu3p4OZZg=;
        b=WAMGUWnb2lvHqcV3iyXgq/V7c9DXdhh1JWr+HIv9fAxPwlMd4YCWSV4gIty7yGnUbS
         nwRw21hfoY0V2t3mpMJugasRqCUu6mpYkzBu32YMof+JmIN139zNzFA28365YUNJXfJf
         m65460K6eoraaLnm4Vxr7pfK4uturhCLUWgamssW0IwuTilouD+7ty81hukBcRvlqRmJ
         LYxg8H+6PXTekhwWCamhjXbKXzCyEk3iPRGJbySY7sOKMj2mDe9X9P+9hfNgtnSUf+p/
         mFdYUWTcAd3jobxdoEH/bTdaQqtu5H4Z7P1YqTRvlZCj/a4bmLjOmc24rsDjCVS1cVbB
         48PA==
X-Forwarded-Encrypted: i=1; AJvYcCUkCOW7wHBdEn5QcAN4lMwNqQxHMRauK171L0toyZTXzutWb5t8G3Qva4nIM0NX6mtpxWCiQDA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIHM8uGO4LVmCycirFi4SPot9EB4eBe097D16lcVIB2jU5tXsB
	MdZbcYgN+iYoPKDW6JvRiU3iXo0UJV8RGAl/efVm0+Zqs05gRt7i
X-Gm-Gg: ASbGncsxmwV7INcivjEdy3ZUKG+yfStcZ1v28LXIs6Fo+1dZ5C6DX4RbqjxFqQtUQ7t
	X17QLrmRILemTiHUnpxS7KbHRR1q4czfWQ9gP6jpGdFaZTA6hOBHkemYpa6rLEpeny5jI9Ld/q/
	gl6NikPSkH/iFi7dqI/zFhpm8kQdboKBOfbOnwB8MMq9nEaJvZMLcKse9bQhiGUNNe7W1HgKzYB
	ejq9V+fXvHZR+yhDgiTDJ99IXp33xjf81bPp8svUHpBktGiBccXsFGoftCBK3xSsV0=
X-Google-Smtp-Source: AGHT+IE0LFF3/PieQBcv+/M0s57QuYZfV0AqSx58CzpD01bEJ/HlCWgUX1jFHn2Bh1WE/RrZetIfow==
X-Received: by 2002:a05:620a:4894:b0:7be:6fd2:938 with SMTP id af79cd13be357-7c06fce2424mr1035985585a.53.1739412565595;
        Wed, 12 Feb 2025 18:09:25 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c861552sm20492485a.79.2025.02.12.18.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 18:09:25 -0800 (PST)
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
Subject: [PATCH 4/4] riscv: dts: sg2042: Adapt reset generator for new binding
Date: Thu, 13 Feb 2025 10:08:57 +0800
Message-ID: <20250213020900.745551-5-inochiama@gmail.com>
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

As the SG2042 reset controller reuse new binding, change the device
compatible with new string.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..1e29f5975af9 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -499,7 +499,7 @@ intc: interrupt-controller@7090000000 {
 		};
 
 		rstgen: reset-controller@7030013000 {
-			compatible = "sophgo,sg2042-reset";
+			compatible = "sophgo,sg2042-reset", "reset-simple-low";
 			reg = <0x00000070 0x30013000 0x00000000 0x0000000c>;
 			#reset-cells = <1>;
 		};
-- 
2.48.1

