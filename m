Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302D5EC5
	for <sophgo@lists.linux.dev>; Tue, 13 May 2025 04:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109940; cv=none; b=Eb+iYjrqZAYnH+rIcBtbICAH9js5VXElY+3nB7L3gduu5FupQ/myaFWNuUJJe/duX/1WQEjqsjkdErD3byrf1BpKX/4HI7hq7RN1Bi2ODeNcn+PR8zfTwIzH9Ykk4uvw/YwHDVEJfEf6TZpAKrE+siJrZw2fgaezSKDuhSTBo54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109940; c=relaxed/simple;
	bh=hi53hLrUWkV9TsKSTo69nzQE8r+S7yQ++UM4RHhaEGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PcfecoH3gfnLmtcQjhwigwgSEs2SJ6xtTrnCuZE6GfVIZaA3P/QCLCCobleDfNM10/a3WG9yoGIO0rmUzZU+I+pnB04HMp5FnUz6z5EOfHGhttz7HcYd7+RMn2iNY9t2LIhDqo4j050KV2cTMw/BnubVXcXS9sR5eRBehCKAXgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSfbTGF7; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSfbTGF7"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c922169051so313925285a.0
        for <sophgo@lists.linux.dev>; Mon, 12 May 2025 21:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747109937; x=1747714737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaDplt6uD8Ya6GFL9X4E2+dAW3ebBpnL9rF8heIlQDQ=;
        b=LSfbTGF7mitoNM8cZkQyMRUm/q0hCWZYtGGUJoViGB3UhyiWwa93wB40CNraVTP+bB
         bi9aKuQDEmE514m7XnAd9aTvUgRND6EbkopMq6N86RKc0j56RYBLcc0R58chIytVoQ4x
         lWaEAEBatlVUEmoFaZ0EyeS0llxPMeYOIITupRdnlC36wroIZgzKrD+Wv9BYmqU2iH5j
         O0BhRU5+E5U/k9y4xlYPkqemHiDVfq0mBZBay9XDhR9izQZIfOHRTvm5uwp2WKmB5JLY
         jENQUTgZQRD4f32iEmAcfq7YBkDw1I0xfT9pN+U2YuiWNK1SoampfdflMVG7zeeLvmMV
         2p3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109937; x=1747714737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaDplt6uD8Ya6GFL9X4E2+dAW3ebBpnL9rF8heIlQDQ=;
        b=c0Utk+je3FqDg0bFBjRpgTtwBTQxttVtztVQEjyI6LQKGGmJOjFP2DOC1t1ZpEe5Ft
         8qEMjFRuoy0jr0lxmqs3ygj8Cfhoxn4DEUqjtgr/G4gql+pf0hC1EeO0RpPSNssxt2uS
         NEpu+e0i7vxJJy6w2c8WIyw98gfOStB3Hh3XdK2IQQm4zTrSGdH9GY2z5CSzZWHLDHXJ
         X8bP7dypZTn/n8z7BY92uDosb6makdN3hn+sr2PY2NrHMSDGF7oVsY3ydPn9IkF9D8N7
         M0MGe9GSUfgrh7gScdnjwRwEACIOdGqustEdPgBoEXtyDQJ/lNxThgtykdZiqd9ILOL6
         +RVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe9KsdAwAMoi56obf1HzJswtoIthBF6fmegomMB3n96e8oJBngT9ujOYsAHm8RJeSNFqew5+Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnjB4cMKe7rciGeBMIZYjIYtYqjd7YxXq6AxMP/xB4jgsvdgKv
	giKTp345k7hFv/Kj+eZRHR2/ZNrgJRX2S1CHRK17bww3D1iml28o
X-Gm-Gg: ASbGnctITFt4BhR3JWQbO72NjD3Q2u4PJqbawJqSqaOX5+mifMthEwnzwEFAJeDV6D1
	lOK9ex79DtDtGOMjHclPlJHVZp3HUt+ZqvTym0zPYrI15qoKqC01MzaNB6rpXuxBVlcM3NeMC7R
	TIuHs8JsmvEPHnFdfYJIzPIJo7D0/XmnyvrxyEcfzwXqQUaEKPZQoWnoLhnGYasochvhUe72et2
	EgIXtKl3j7P6c/v4/2/shmi2+SwNLqikuN+IU0Nh2T2ZXXXztAGjwko1np2oGWwiPo/AiZQ8TXl
	Rl2lGW66G4hGZoAAsW20dRF/8DHaTB0z7o3krQ==
X-Google-Smtp-Source: AGHT+IGlBRWOdS3CfEkXVh58/z7On7nwxsAIWM5VLGw1h5sQ4XN4zOiVj+aqM40scUBbTtFSgOXdbg==
X-Received: by 2002:a05:620a:9518:b0:7cd:155:383 with SMTP id af79cd13be357-7cd01550387mr2276285385a.30.1747109937021;
        Mon, 12 May 2025 21:18:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f6378asm651965985a.29.2025.05.12.21.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:18:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 0/4] riscv: sophgo: cv18xx: dts rework, part 1
Date: Tue, 13 May 2025 12:18:21 +0800
Message-ID: <174710989159.597941.17259091695735282020.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430012654.235830-1-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 30 Apr 2025 09:26:49 +0800, Inochi Amaoto wrote:
> It is a hard time to maintain cv18xx/sg200x device tree file, as
> it uses something that dts override, shared peripheral header
> and something hard to migrate arm64 arch. So it is time to rework
> the device tree file and reduce potential problems.
> 
> The part 1 change mainly focus on the format of the current dts
> file, and try to make them easy to understand and adpat for the
> arm64 arch.
> 
> [...]

Applied to for-next, thanks!

[1/4] riscv: dts: sophgo: Move all soc specific device into soc dtsi file
      https://github.com/sophgo/linux/commit/e07daed2a1577ec5b9eafcfa0b690d4082661024
[2/4] riscv: dts: sophgo: Move riscv cpu definition to a separate file
      https://github.com/sophgo/linux/commit/4f6d5f22f94db169b58809de57db2fe95ce3fa35
[3/4] riscv: dts: sophgo: rename header file cv18xx.dtsi to cv180x.dtsi
      https://github.com/sophgo/linux/commit/4a7f2bba7bdb2d3afbca8d40268503d32868c325
[4/4] riscv: dts: sopgho: use SOC_PERIPHERAL_IRQ to calculate interrupt number
      https://github.com/sophgo/linux/commit/53cf91b37246948935de7147d09ae6a98070400f

Thanks,
Inochi

