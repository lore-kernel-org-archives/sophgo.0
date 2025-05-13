Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBA1EC5
	for <sophgo@lists.linux.dev>; Tue, 13 May 2025 04:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109952; cv=none; b=l4z4GdEqWS4HLSW1VdzZAHHa9QiiaWKnYYN13s20QGisnF3Mtp1q+vT4PSlmacPE2A4TQ3XGjLJ8mFCpiOTun0MmEgo5wmYMxmGPihFLgmVeI8ZHeULlnD92ALG8J5k5IVbCg+TvU0Vqij1K7Yuba3efzBaxqTY8jNR9ndOjzWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109952; c=relaxed/simple;
	bh=T+3x9Od6e/lqvamBfshpd2ms4FrKOSPZgnkhArtmF8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FNjLaI/vfSDURGzNVoDFZN8RSAHgN8lCubRdJe43tfc8ED1FF0UCQFLUfcmr+oEX3qTdiDJtZ4FThdaDA6LG5UT6Kc1zPjYnFayZDs0O30BSza8HqX5IyfGh8+wXAKtx1Qk+vKjZbFLXZ8dtpZwUaSUrEBd8M7sZmPu1xYhVec4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsCbQmuq; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsCbQmuq"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5b2472969so579883185a.1
        for <sophgo@lists.linux.dev>; Mon, 12 May 2025 21:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747109949; x=1747714749; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbE8qOEQ8Cewj2pW9YzTwebuhpk4BnHjgjL+T/zo0qQ=;
        b=TsCbQmuqi3pwanXeJ71VZ/CFNuGG0WZQutLhN2gGR+N+g29Jyu0WHBOOiIwrrL7gkx
         U30LydoLxxuJEURV327lwru4lFussaWSDKLVFvMf2Z2Ym7Q5qGmpLjRIYzs4WIj24rxq
         0Y556R/pigQnUWrBycZX7qBRRd9WpgdCuaonrjRTTjspcSBaLLTgPJcHElPPtEXfkqBq
         Rx9HPkanBUxdA+f7IRR1eWk/pmyxkoicBD+UjVBRjiNcFgtVcB6kxIruiRGsecDQwVGx
         40CuAa05ggcAUf8c4Ps36Xmj1XF5DhPHj9uz6s2rOfkVzmQn477QOb9GmdRTZ110GUyg
         H/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109949; x=1747714749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbE8qOEQ8Cewj2pW9YzTwebuhpk4BnHjgjL+T/zo0qQ=;
        b=Tig1KcMBv/zfUvzK02LsXxNVOF8qggDpt6LKiTr6IclwkKgFz0eN0Eybh6kJMD+0Ud
         142wv5RXgf9AspZunAV9TfeVSnzT/HfaXNsBWIhLVSYqmWWGSQleA0qmg46m3yqAYQyX
         dYnHA2qP4ppR8VH5iLraFHwB7zOPaW8w+s1u0IiCCkLTp1zjPJmIS9W4jy3cnhJE5XR2
         SZl0CdwluEkrdgkUbSyE2MAmoArssPJyxVKp/HHvLk56LjYeHpq1ntTpYks9dMmc7w0T
         vw1BTzxebGYXHxHROaHdDskimbgreoJIouEpu5SjPFj1N8+zX3ixO5Fzt0hkE43fVCxx
         Amcg==
X-Forwarded-Encrypted: i=1; AJvYcCXL/NSaKDmOUixIEbJ+1+TRbRfAQDR0fDRzCFJZllXE6KxFUL2USrUleWv9caQjccfkiaGF76M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNv4MMiCrUsQClzEdRrlZmlvt+6MU5RMF2LRuDJZhrGt9D/sf+
	VBozPsHnay5kq0ywg7DoG1d88H1mvTgSfyE7MbB+hBcC5VoU9T8J
X-Gm-Gg: ASbGnctmnJNwesyhdGRIQNlPLpypk6r+kLmRG54zIL2VFh6b72q8iBOHw+zDc4kVP05
	4qinfPdfB1VCF6u0jTrgJqHMwHS2V7MSj46vPUeAgFLFmbbN4cnAsYqPOYBGjIhBM6cdM4UWRTg
	/5kzpcqXWL2dDn24RuVt5zFo4AJomauStNHF7lkmpZZI26P/lG8y+/GI2QzW6AZayM3uRVgnm/P
	5xDqhVedTno1Z7PaF4OOGze5xDzoSLiLZdfecWgIrxysnfQm3BodjIPBJBducYrULX1sodRBP5B
	E2DHnDkmflbYO+H9iKOyxKb4Y48=
X-Google-Smtp-Source: AGHT+IGaGXEPNSY7gDD/YfTu/S9mOVv0B4S4N0WdSovqwATeGF5yrD8SEU/YDNwaJa71opCgKDqwWg==
X-Received: by 2002:a05:620a:40cc:b0:7cd:1ebe:9ad8 with SMTP id af79cd13be357-7cd1ebe9b28mr177227385a.10.1747109949442;
        Mon, 12 May 2025 21:19:09 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f6423esm652274985a.30.2025.05.12.21.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:19:09 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 00/10] riscv: sophgo: Introduce SG2044 SRD3-10 board support
Date: Tue, 13 May 2025 12:18:22 +0800
Message-ID: <174710989164.597941.2410446871539052309.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 14 Apr 2025 06:34:54 +0800, Inochi Amaoto wrote:
> Sophgo SG2044 SRD3-10 is an ATX board bases on Sophgo SG2044 SoC.
> This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
> 1 microSD slot.
> 
> Introduce basic support for this board and Sophgo SG2044 SoC
> 
> Changed from v1:
> - https://lore.kernel.org/all/20250407010616.749833-1-inochiama@gmail.com
> 1. apply Rob's tag
> 2. patch 1: new patch for grouping all similar compatible ids.
> 3. patch 7: remove unnecessary compatible check
> 4. patch 8: adapt for the new patch 1
> 5. patch 9: fix copyright e-mail
> 
> [...]

Applied to for-next, thanks!

[02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
        https://github.com/sophgo/linux/commit/1e76b39eda76f7317ab75dacccaeda5a5b02c519
[03/10] dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
        https://github.com/sophgo/linux/commit/a3cc46f7925b6b48e80c70815e3f637abcda77b9
[04/10] dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
        https://github.com/sophgo/linux/commit/a7470f20e271203494b4cd427e687c12649f0087
[09/10] dt-bindings: riscv: sophgo: Add SG2044 compatible string
        https://github.com/sophgo/linux/commit/9ee1f97cf3e1743591ae76324d96082c8fb496d8
[10/10] riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10
        https://github.com/sophgo/linux/commit/c8b1ca99c8485036cefa962aead3a0c57cb27d3f

Thanks,
Inochi

