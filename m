Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C35B2673A3;
	Tue, 10 Jun 2025 20:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586374; cv=none; b=h7kZTgE7MfP19NQt02ZCPwjpoYTmQaTQkqyJK1+3nv3u0wIVtzjObeSAUgR/9p112Fy/dE8HB92jIcuv4tj+xyxEJyeBgomr8rWHu9gKacfgw6r4AuZ8corM8vtD6ENvHDzobO8sl/gXakE913V4tXUVzkfZwV4LvK2GlmTokHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586374; c=relaxed/simple;
	bh=NzF8D+jscEUsAE/1/Fd1SPvbvgtFxlYHFfAZNNIr8K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mySzFlv0jAxAqxwPj+kM0G24GOFHg8zI2oLkPwOPTeibP/UCKkglngdXt9KipT8RJ3j3WgkNBaGlFG8n6vj9uzsAqU8owlPW32Usyq7X8YFHE2o8NVUeDMirgU1Ejp1+/ADuLp/1TOfHU3OCzRlXJnATqrrnxIM4Jt7gCpc5W7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5lidkXY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5lidkXY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450dd065828so40735425e9.2;
        Tue, 10 Jun 2025 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586371; x=1750191171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=;
        b=W5lidkXYzVAu9WaLwISpUzzLI48vJLCtdBasnqmd4g760z2JI73yDovEIim6xvJIPR
         dibdJEqhPUFUuv6Q5Ekg0Vs4sUGeb/4DZUGrvlXsXf4SwsuIAd8vkkTrIqvba9dPxl6q
         VGBPIWJ9gq6dTOgbU4qO6UBoExbSGXAjJh+6k983jy7dt4/M4/XXJpu5he+a4g5UrQDW
         lMj+OvzeUxW2HhD+UuM7nEZ0juNjxUV3+CgXgNPWvkKP8YPsN1b0hnJsqIdJPz7tkf85
         86k3+q10smaTe0g45l6HDRS6oq06cYsUGPtXaFisDpNiiFA8IRSSMGq3GWn8w99flpa+
         6q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586371; x=1750191171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0Nsk7L1UKeSgGVwlEzlmQB/17oGC9kEiuXWeGaDs0s=;
        b=TECLy7T/hsE2bUWdqI1yCy8kXqM8A385lCYQdOkUmN9o1oFeVisohtbgZhLgf/tmjk
         Ij31xLWodVJJRzShTYyb2ouSoFj9CxKZHzjIqUsrnFmAQzpMfO94Z2xwvSE7VbzuWwu7
         Ge+tbUTB2G1uSw6X1U5WpnA7Q2hkrKZEYatbBy1GeBiLvZcYPV2drd1OttAkeqswBdXp
         F7dWl9BMWD4/e2u7r/6Rp6owY8/MQ88yX96IbOcuvgVTUocc99gBAhboYV2aLoYxJB2Y
         /lPX78VsnTxuhKlRjKN140LjgtpHtwgefnSWNiv2OdZmPk+SOtSvMMCuYOqvTITBocjb
         3FPw==
X-Forwarded-Encrypted: i=1; AJvYcCUUODNHYWA1aQPGgLjYvGQftulKl3qw4nBAFTtyrSVQwkFcgGi3DV7GO/5qxKJwf1xiaXw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4PhvOGQ5WKSxi0wq9IE64od07kuiUvA0hqEvnjfmPIAss3o6q
	cos66ZOQTAobE+GCoDbN79EGfFJdz4sP2tnNrbE6KmgaFX27fH1F5suXy4HAd9vVpXs=
X-Gm-Gg: ASbGnctT3Ud6SJ6KqOYPhTedvyK36hBExmMQZt/cujijGDqLvZ9FrEY6OpoII7D3tiV
	XH3rAUUFN4Ittre7SMmTBx2FWrqIOjrfqLSkk3hawvlRV9wWhHOvnBWgaj36krp80dX3FGwIE/l
	mpAckg5177Yf4sB8DpO+/FUTM4/cq2hrGUeam6Ogoxfxyuv8Y1LFfPLlcoknzT8ZQ6yyBPaHnh1
	IGTLOjWuPDKpK593HKRj/jKgo4oSQVm9IoEEtpyjrZ1LIB6kJAwRXdEXnHaEMtgCwRVNRtsoPIu
	mbR8oQDeBFO30Zsyj2FVM8MQuR0UhO04zKoEVSB4DbxWNoCLNHQPZBlDYqHJ2Cp1+j1Fp8qdw9s
	=
X-Google-Smtp-Source: AGHT+IHAfus2as8xEX4iDfu63duVTXHrbs5exQRrMVtiCIQNQ6/TZbKnWxqRaxxHybEddLqJocBNng==
X-Received: by 2002:a05:600c:1395:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-45324ec37d2mr1288935e9.13.1749586370869;
        Tue, 10 Jun 2025 13:12:50 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:50 -0700 (PDT)
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
Subject: [PATCH v7 6/6] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Tue, 10 Jun 2025 22:12:19 +0200
Message-ID: <20250610201241.730983-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
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

