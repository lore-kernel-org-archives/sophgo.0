Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A89230264;
	Mon,  9 Jun 2025 23:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512518; cv=none; b=R5+ThhUo+AeS7l9Nt+SdrNs1ZV4i/IcaRzRK7k3eMjsfqZbdgx3cFg6Yqfc1ouymJp1BiqED1Fe+GGl1BUILLgL6i9gAjo3OWz3prk0o7pQKAwjOGEhqBaCOzVmQRPefl7nSoWsZPMeL/6JsaaFFs4/vg/Q+aNUjebOUkHBcKIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512518; c=relaxed/simple;
	bh=lcxMmmgMJHInwGzpCFkRWzyLBb5iGz+frAxW/UIgQ4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RytW8BQq+3fhFwYVdAKsBwPz4HCLYBNT31jzHxWKfrM0K8fgqnzwplVqtwuNybVt9eEh/nkY9SI2Ef5D1RokoM6Y/hHVniZ6Nc82CSN+TMdJwWFIMNYjtNz5620Ai528bMHjHtWguP/nxYBzyVOSrW4tISc/5pQOjhE+W7N9UGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXTf6DX6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXTf6DX6"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a35c894313so4354838f8f.2;
        Mon, 09 Jun 2025 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512515; x=1750117315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrPhTIZpQpTInVFelKb2k4Az/r9q2Weg3w4rxnkgyCU=;
        b=WXTf6DX6wWo4/iincLwhrbo3h68UgIA02G0bZvy+IIwpdt5svhS8QM6D13k50tMUKm
         4F9C6HZpKLBZCZU+w/wmeIWAafklXdeH0KVFLs4DDMc9lfLoHjJruMn+/6rgayx5YThx
         vmm77/3nsz+9YcFRW8ulsSCykZiRyOwGthbSt9gSfRM0AftXVSlXY+kP2jgJMlUEI7nI
         2mdjwMeji1a0SDMnIM+fxcLIgybnUjwu8O5zePKaAGFbtGw8g5wZhYjCSGPuSeBU35Xv
         1HKXDzgBs199zUEHk2hzLXB1Vgm6Zq6L1QI/DJPm8cSyQO9PcYaSg5LlfYNxq5wLP6WF
         2RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512515; x=1750117315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrPhTIZpQpTInVFelKb2k4Az/r9q2Weg3w4rxnkgyCU=;
        b=orLDpWnRtz6+B92sYkuyLUipozGcYHQwzpBqL/N02tmVQVTNOgi90ajTixQY1q3Iwr
         9wJLLft4a3j7GOb1RhAehVfONTLLhkOxhnLVp747tOayKFUI1rtmbJAUg/Y22QP+/f4I
         t/MhFxPmjSOx+hf3oubhekCqHqZEJRu/VW4qYzNoQ6gCMknSIX7h+ol/yLtwjrmdxSzN
         in2582ZavASWCs8oRW7QgmxN14j+cJHQ0UjDmDCgfI0Kw652xHEcr4wZAvWciF1fd2QJ
         5o5SjU6hRrR/7VF+Q5zQhSjQfavOrX8z3m7gRnKWge+Ex0iwzyf0LtWlQtAR0JstrCvs
         5aKg==
X-Forwarded-Encrypted: i=1; AJvYcCW5L6Ee/zAObTyWzdW8vEKJtHMsMNGhE9bhidyywQhB1k0vmDE7NiOAlkZcV1jARfXac6o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz/KzS0KqioLBSTE5nODP3p16TCPj8f+SFUohJvUcstqbbB+q5
	xfAvlyzWAr5FesNjk5rihGIS5BYhCDyIjKdD5bbxtvig6oyLII4Sc7OYyAEmSiPsJmI=
X-Gm-Gg: ASbGncuwGye6wNxE71hEOiX7fr/9jjSDW8CiuAEeLtrzD2e7QW48BC3ZyklPFGl+KCs
	pH+KQEtnDqm0MfzolbZSjHZcHZ9OMAKjr7g8QTn+JHKhCyjYjTCpbs2+B4aKIKD1UvE+nOQZKL1
	mOuj5F97KU0T2mZeY9HHkWT3qvcVTxtGLlkyGsNkky7/H1WChg9TGUQoWA3lrGw4vt4NGykMjeB
	TR/ByOkRtBWwi+aCNnJF3L48m0ARTxBit8w75U5KePc9HP3pzBen2Fgl+n2CNN2efzgpBspjsU0
	0OV57XcgKZ57Q2DrkDe7aPfOeUtXwFbecuxsuWmbR3bwlQZf4rklgrzmKaqe3L8vraRLt68Z3sE
	=
X-Google-Smtp-Source: AGHT+IH8d+d87qasytIhytWan/WEKNQkCJ5MRSNoOqGEJq+vqhXarvhfJpA5UduVPDcP1PlcvnPGqQ==
X-Received: by 2002:a5d:5f4b:0:b0:3a3:727d:10e8 with SMTP id ffacd0b85a97d-3a531ce7122mr10392078f8f.50.1749512514738;
        Mon, 09 Jun 2025 16:41:54 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:54 -0700 (PDT)
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
Subject: [PATCH v6 6/6] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Tue, 10 Jun 2025 01:41:17 +0200
Message-ID: <20250609234125.722923-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
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
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..84c85a222b3b 100644
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
@@ -1411,6 +1413,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
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

