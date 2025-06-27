Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD9A291C2D
	for <sophgo@lists.linux.dev>; Fri, 27 Jun 2025 23:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751067128; cv=none; b=uZY28h+IMJZyRFh/hzvYqib812eifh5oA/QP/YtGdF7QTpCvojiajgA7SUjb5y2E5Z5YOroqgL1M/6e0Wxa18MjNPyFHQvye3j/dIKCFuaaEOFvGfbm9Ncn5Ct8xXVFUWvTtiRvSbKBDwpU+3qvYOwypORwI9aSgqBSeZQkR128=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751067128; c=relaxed/simple;
	bh=YPnTiOfKeorNB8r7cpyKWvCUxr6j45iw769OI9lLoV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ss7XG3PK8ywZfxq0kgUL1vXJSjLq6nFpYwiEH7qqLXruaQAbgGpfeRxYB6erUmsUzwZRfbWhSJhq0DeotU4bqqOe/Qsc7JdFyLU19EBF/AG6TgFPpIr58Gh4Td4mcjxUZH8rZ0NkGZ00rh5j2TS2tn2IwqSZWJTDls3UR8Orbro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwXVFmH5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwXVFmH5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235ef62066eso29561705ad.3
        for <sophgo@lists.linux.dev>; Fri, 27 Jun 2025 16:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751067126; x=1751671926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+DGQNS5yV0iBqaU1x/InlhD/xcyDEGMcKU4WcCfmD4=;
        b=AwXVFmH5eK2RRVomJnyMFgkj7tvKgATDuIFVBKMm7FokcBQ0SsIMWY12b4YgYrQ6qM
         6EuF65byLum+f/pzpAgT9Xax7sqm47HMK0ormakxvqCbp/s1jt+GBaWRWmB1rhNU5ByV
         ds2i17RhVFiC23TKuVxd7YnHlYlh9xw1DCraO3BHlrgdadYwjttf/BMzMHAd/p3ejoVF
         /3lD8GdljfTGcYkcIaYll/4XYZQPX4EWB9YhlfbAzdzrEFF+RItFjW0T003pVHmv0dRi
         y/AE7iJ0QRoyp6U+RbjtVNM/q+ms9GQ42zPWsI9Xw3oGikVZHp3IbLm+Iz12vtqlOJ6q
         4wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751067126; x=1751671926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+DGQNS5yV0iBqaU1x/InlhD/xcyDEGMcKU4WcCfmD4=;
        b=k7tB7VMk2Hn+hsz+hUOqMfB1Y1n27IovMzWTAiWuqShW/USg9gOYc7nNDfWFVcsdJ1
         ZqcxGiDNu9fIvydDeJvYWlP1CqizF3tXvUbpDZo1jMLNMirp6WEkdH68QIjZCxwTos4T
         iWONLsTT6LSFVmw5zMtTWeEjqJkY1kqXXeuCFjMihAfjZ2lwBWUcBBxoIiezHPWD7wWt
         T+HL3pBLLmkE2JcSkhXQm9vE1L0Ihy2p0lO1kQ2tmeCanjCJWDyrMtHDsUPzc4ZqLcKZ
         hKs+mkaTd5C9FLeviXOAIF/Hr0W5m/E9aWnxV9nm+/V3t0jqLc10jy3xWiJ4iYuvRacg
         El0w==
X-Forwarded-Encrypted: i=1; AJvYcCX31VKiCjZgvqqXocDg47nm6UvJquNnhGDPZ4o0h3LgmcEaMSFZqy2gUOHVo6yNB4BFO0TgKnM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj2SuHSp8/IDkdOK1wZ+ZZ/1nRpuquvUTy78vO5E9OdImt+zKG
	OdknFPPXR7CeBYQNqUJRlxWAjCMGw9WyiQiDdWHGTtxAKaOUQ0xOkgc1
X-Gm-Gg: ASbGncu5kOJBdOxeRPF23PyWHfUlFa6BWG5z7/AraDtzvBDXM9gkOoZKPgzpVyRwd7Q
	3SleLCvhDn+HUkO3Fn26mN8CT0Rb5NGBNQU9Uwl6QL+JGE6/O4jmCv9444kocmoOiyir2eBK6Zk
	elei0k7ssgt/SFil2Nc+H9xSeXJ0JH347VZlcHdRSulbqTooB8EL8oSXGW9uN5LeJUUaa6bzk82
	b2T9CjzxRnmA8H0X4vIQbRcPbJ1eRbqYYKsyC3Iy2VPUfzLUmUdnUmRf3HmhnLIT7rMs3MOB056
	BO8eNE6G+edBt3m27iAqzP0WREobGA0v8zoSx9hbcWgVAt1Mg58c2iBn3SIXTA==
X-Google-Smtp-Source: AGHT+IHg7vP7/d9S3v6EOl8gQObtoAsfGkXEWElQTHDuv46nJXJg9sI7JyZdzQjwWXqvHw/s8C35xg==
X-Received: by 2002:a17:903:b8f:b0:235:88b:2d06 with SMTP id d9443c01a7336-23ac3bffd96mr67891485ad.6.1751067125934;
        Fri, 27 Jun 2025 16:32:05 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-315f539e6ccsm7564660a91.17.2025.06.27.16.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 16:32:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v4 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Sat, 28 Jun 2025 07:31:50 +0800
Message-ID: <175106708298.79260.10445943203117657356.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 17 Jun 2025 15:01:38 +0800, Inochi Amaoto wrote:
> Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> Add necessary code and bindings for it.
> 
> Changes from v4:
> 1. patch 1: convert the compatible as entry of enum.
> 1. patch 2, 3: apply Alexander's tag.
> 1. patch 3: apply Junhui's tag.
> 
> [...]

Applied to for-next, thanks!

[3/4] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
      https://github.com/sophgo/linux/commit/fcb3f47c81afe43b336bf8033234417445789807
[4/4] riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series SoC
      https://github.com/sophgo/linux/commit/880f18ee6772d4add69519cb7de2fcf9f4769cd6

Thanks,
Inochi

