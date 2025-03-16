Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A951F9A91;
	Sun, 16 Mar 2025 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742151414; cv=none; b=Aegs7kb4Ts7EyvZ1g9CDawLgsD53v64N9IQF/7g3TWKNOzAelOI273vQs1YKUILrbxHVfA+r2PrOmZ8nvoS1QCKfFiiZ4qHxJawqs7BOsGGftC5WbJTT9tnSsnpdmk6EIfeMZxyQr1PRY5tRm7ZEiZOQCMDkDXFwkJoJIq/q0ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742151414; c=relaxed/simple;
	bh=aghljR1wM2BDQQZuPDhqoTtY/vyWZD8fyPWNjyzLVSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQTCSDw8w/+YviaHNXLHR8iDfswHKJa9OhU8ZBCtpnaBf3GzW2WLdmh4lqPSXx88K1tfSPTspK6NK9V/VQ1StCiFw2uSwEahg6BHiSaZcb5rlCNt0Iici34onI/0nMtZ+ytkfKR8hf7KLAFPmFvtA/rh5+eaD9EUM8o8DC7jxGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrcaIJzY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrcaIJzY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so10104895e9.2;
        Sun, 16 Mar 2025 11:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151411; x=1742756211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKV+hWN9JpR1oWviShl5FW1hZNTpiT4lwbZMt2wB8jc=;
        b=FrcaIJzYfzY2QoHT89CbKzcwJY0MYTaSj1sIWuKvrXqRE7wt5ycCdRLBj8IYk26UuS
         AuP5eIy+6FPslvoyAFQGrkxopU3RBEa8u4kijlyfE/jQFpgT3UP8MAK+FBI5AeaT4FVF
         wy409r056nT6OPKpFx5NhQK++QX/FZYhU4fvCOFAWMF14EOLAZMe2reSyzqcj5C8chF3
         Zx2mWNSxDrEp5CUpkG0GIq1swpt7CwE2fMsPEzjSuneEvvtw4qz6yHbasoHJ9dZoD+cU
         /4iSI4xgUsK2BxPzbFVhjC85k1Z6ZAb9MEOIVGTyyyk55AzCqHfTL0WqhKt9D79Q0zsE
         KJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151411; x=1742756211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKV+hWN9JpR1oWviShl5FW1hZNTpiT4lwbZMt2wB8jc=;
        b=q3wbeJZB5OqTVzPwCL6ymE6A+WCmQ52LixQlI008OKH+YPjMRoev2YuG173Sjo0WlN
         3eKgpBAZyYsFjWPw7D/xKuYKR1pyJsz1Tdc01RAFwUYiq9jNzFyfb7sxIPxQ/X9g91GM
         +Trx/Z6OsCs45Co8Q71jm0DhDQ1/sUZorpTojIMbwEYRw+PWSyMXOgxX7L51nYpcOeFb
         Rrn8mRndaJuk9+cZnwLdnvL2+ubwFMme1E0jsJ7YiLE9UNON2L0k3igvGYWNCrhm4Gvx
         4Zm5uludaVaHVV2Xi/s6uZ1f03HgyVsK8hlM+kXHDrKQoVzMBZ7IQPD1AR30lEw4olTH
         ergA==
X-Forwarded-Encrypted: i=1; AJvYcCUiX7SZ5TJJZkwmsZkCzrYsO2sVIfoUS/ChR2fD+LcYxVo4vNL8X0cMKm4eB39PlWvitic=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi1BtWFTYF7AplDi40JQLZQYF8Nm8FnCpfoVREi+GT5+o8vPg6
	03f5od6QhXWvz6u6bC1oYwthDNqG2W10cMUyTU4+pKmqqLDkEL9IFUB7FBAv
X-Gm-Gg: ASbGncuNFmNmHmtw3h8TIqZoUBr21QRN0nIAr5X/KfyXQrtPyOjNVuIckebZU8aKzvR
	rGHeV38Roso35duQuGvBPMkMUf8bJGzk+VesxXT47fa3wYKe7ubHfM5gqyKPY+k3TVLQDbKVwl2
	ZkVpKpTA2gFnz0dEAZTIEFMza6kMoe/T//+lL/JpXB99ImZdwVsYmXZLWFwmrk4bvtahSHky0mo
	gbCSz65BwE3b0jSedkM4U34UNuav3HG8kdWDDH6+88mSQ64+1GPUCEdlBAUOphBFG9w4RNRhHyj
	cHi8BPwacSAoT0XylK0jhUB5TJx1qTiE8tAVQfGRx4In15Ht+l4yggxRnM2xmAH6F1Oc
X-Google-Smtp-Source: AGHT+IHLZK3FCf/r7+5MKurX3pr5o4LJldkBwRRoPZ2/8ot7v5lwjboRWlnOjFSLvqToQ7g90WgAwg==
X-Received: by 2002:a05:600c:3399:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-43d2230311bmr92200575e9.0.1742151410666;
        Sun, 16 Mar 2025 11:56:50 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:50 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 7/7] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Sun, 16 Mar 2025 19:56:37 +0100
Message-ID: <20250316185640.3750873-8-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable ARCH_SOPHGO, pinctrl (built-in, required to boot), ADC as module.
This defconfig is able to boot from SD card on Milk-V Duo Module 01
evalboard.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
v4:
v3:
v2:
- moved CLK_SOPHGO_CV1800 from Kconfig.platforms here;

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index bde1287ad9a7..9c01f5333f0f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -66,6 +66,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_INTEL_SOCFPGA=y
+CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_STM32=y
 CONFIG_ARCH_SYNQUACER=y
 CONFIG_ARCH_TEGRA=y
@@ -652,6 +653,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1409,6 +1411,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
@@ -1528,6 +1531,7 @@ CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
+CONFIG_SOPHGO_CV1800B_ADC=m
 CONFIG_TI_ADS1015=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.48.1

