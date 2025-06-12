Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4B02571C9;
	Thu, 12 Jun 2025 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734922; cv=none; b=t3yrSQB6SP6dlEoyQUvEWmvtTWvVzNMfhE0rL8YU+PDDg4O8oZFb2hA3hREgFi8FzsHvD6MZMufk5Sk9URsbZZSqRt2clwqC5NpxB+YvWsmTmhOelGb6KXZDGlfqWHH9QhCbiTdR3xTMkE+OBhPFLYWhsPS9eFYlTN7/lUEjVLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734922; c=relaxed/simple;
	bh=NzF8D+jscEUsAE/1/Fd1SPvbvgtFxlYHFfAZNNIr8K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9uOaz2atTOj+zWAzHBvN1QYqEVWVTMsixwcckHUf4Xn5sFud9Q0HAO/DcryD9EgdRnKMmaSEMdsyRsH9BM1z14R+FYcQq3rQ0gFZadXQu+L7HWao2mtumt0b38IXeFthagQDC0DVzlkXtvpSO54MNyaJ4sukCt4t96qgqIEWPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2u1L2rO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2u1L2rO"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so808298f8f.2;
        Thu, 12 Jun 2025 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734919; x=1750339719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=;
        b=R2u1L2rOqhKGh97p8K/C7o5ewFgr5acZJVRj1YmLwDB3kV7igLkrt3JDQQqmoWY2e5
         Z+hXuFNQ10WUwr45DKAMcFhNzy8Nl5OpH9YFGfccXV1vANM34BTwWWbLWDu5uHm0Evkx
         7ztUpJRgQ/VyfMqiDZ5EBQhcKFNXXUfUyaujzIfVmNKC2R9ytpH1xrOTMsVQ/3j+qda4
         v/3OpreqGHb2y17Jj8vEmjsH3sa++iIxWkG9TTKpzsTX5nb/K9Ez1hEg/Fd55rmvfrWM
         Mngs2Zv6FqrUeVTHhEUy15H1Pgv9cReF9+1AP3htzKYO+SLZpBCvnUEEB8e/lMgeHMGr
         4o1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734919; x=1750339719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=;
        b=pSrCU3Rl1yt5IGxrWAU/+bAbN6fruXu0RJztvVE92pGPlxwxKIFOEJBUotokO0cn3S
         Y3U7CoXqD2sExLzGZKUkwUz9PVhGCj84rnkLijb7sa+gKG9nZ7jpyZlf34s2bWl/6iQQ
         wRLBiaHpO+Pekl8meF40lVXIbxFMDUi3q1sHSuT+nzgAMt2dAyQ+wVHdyr8qvtpMZdnJ
         6OPquWu9vdFAfTweKJTRz2RpmF5YF9Q6GLefLfx7XebjsHpeeJVHKhe4Xp+usCR0WIke
         eMBGd7p/pZ6uydt8ruIfRRTmDAioaBZteh8Ppzqxm+SSz4C9hTGg5kGwRQ4e38X3y2eB
         A/dA==
X-Forwarded-Encrypted: i=1; AJvYcCXMDf3HOAK8GyDhrolpLlBZrO55eoO5uBC8tQBXwI4xKm97o4AeJCZuczlcKpAslNT2Ar4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSaIcI00kb5e2DNurysbRPRvKJJOiMq8nuPzUbQgE8rACkDTvn
	Spr/fKwmPRt0OOo9lSbh7T1lcxjaCdfXtmfOL2Wi8DkSXO7qs1gSEvaPtTmSCH7E7nc=
X-Gm-Gg: ASbGncsx0G0bAwR6OT52MIoE06eZGZqlR+oVXE8RQTxs1dezzhTuWQVW5nRMQV2pKnC
	FxecQMbT9217kmgvT87sR+sNiOQL1p1iXGnO6rUiMdPhK8tnAsKqJ5AkBN17JIm731FZrIeAdqj
	6jREXfdrWcA9X7cOMLQp7+Bz1kfSCer3wHbBqMean9EZrex/CFTPXhO8FyYtA8+IOgMQbFlC8nO
	B76ohvTc1R3rM1fntWCepoBhfkC4ixKKQWeEl+C/1UOwNN0DZUS6u242YxIRBzHFFTnVcssuIp8
	+6NYyqgEfSisu64KF4fn2KYVeE9Jo83gftizGaKGKNPC6o7yP6SP0XYsIeYH13eN/AH/q/yiK5a
	H2aMsAyj+CQ==
X-Google-Smtp-Source: AGHT+IHcFVWEX+KjeW3ppd6At7eyZ4IER05LLmIVtxkWrdoTFMl7T38r6NDDqCMPQK/Fvj5rzzGoqA==
X-Received: by 2002:a05:6000:26c7:b0:3a4:f70d:dec3 with SMTP id ffacd0b85a97d-3a5606c7a11mr2662391f8f.16.1749734919190;
        Thu, 12 Jun 2025 06:28:39 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
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
Subject: [PATCH v8 6/6] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Thu, 12 Jun 2025 15:28:14 +0200
Message-ID: <20250612132844.767216-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
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
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..b43f9502acce 100644
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
@@ -654,6 +655,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1430,6 +1432,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m
 CONFIG_HWSPINLOCK_QCOM=y
@@ -1530,6 +1533,7 @@ CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
+CONFIG_SOPHGO_CV1800B_ADC=m
 CONFIG_TI_ADS1015=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.49.0

