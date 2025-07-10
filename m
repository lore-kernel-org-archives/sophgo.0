Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E686334
	for <sophgo@lists.linux.dev>; Thu, 10 Jul 2025 04:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752123018; cv=none; b=TeCzljrrY9eK+X0ey2zSbBIiLiBYk+lepVa0MRckkPJcSx7+AX+SODcFJouElQ/LSOZQprjkvesUf35ub5APaSHnBAbCZ4MpBdzcEw3F31rvj6L2v0U0+qMDoD+7M19QZhMKC8gtjUd9qRmRx2DJibZP0U5o0AuJ9IfPAAR1TNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752123018; c=relaxed/simple;
	bh=OEspdNkpeaGb6UthJe0zFS9Qljw+kdaXflFHboC9c60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jQJukdn9SqYfzUhlInag3B0iAjsLQwC688PMl+DalBbDk172nqyFgPlTmj4i77K9cNntDhXOzA7cXFvDXiWqOAbAx0ZsD8zqtIkBeOZXaQp0WSl1GIULFvCzyeFblRnUdBMXns0/mJFSh06KVFbdW19bNXJZeM/b93qyGx1Fj0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnYEmmP6; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnYEmmP6"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74b54af901bso396409b3a.2
        for <sophgo@lists.linux.dev>; Wed, 09 Jul 2025 21:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752123016; x=1752727816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43W4i1GCTgED74WiEGNoHpiF4mzL+pQO2g8gssUc4vE=;
        b=DnYEmmP6R92xqIiTlQWpj4K4WE5gLJ4tK37nyPHvOA1S34CcZ0EaStYk7NmWuvmq2+
         hHwgAw/jKqMMJsMWwenj65Pmqim7IAljAnxbzug+xq3y+9Q3fgoxUs1aP1ksMgb/T22k
         w+ETxtKcCq41IjCNAIGynep6KvSInEsXKieUVqyPM49MtUXB9yTYP8xqmLG9oZ6+o+B2
         ZqKEmGiTHTnEY0MkfDzTyfrobopknGXuDGkCpAKeAbpVQX3kFdar2Z9V7OrlHcO2aGEA
         YDE2yfdbAwk/VrPyPHzLCr3HktDauXxKS8V9otey1j9Oyc46OgTFujIxRWNqSgeSo1it
         5nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752123016; x=1752727816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43W4i1GCTgED74WiEGNoHpiF4mzL+pQO2g8gssUc4vE=;
        b=IOf3X3akys4EHSuWLARzkc3IINM+bwMrddHaC6fu3Aaf7EBk9jRGBG4dEdTVlXvjBb
         1H4Vq+1C6mG6NyYQ0OnS9WQ0msgjBKJ+OAXRPP70+xK5OhSs3+p/k/gVi6OaCVQe+Qi3
         V+nkmtU+JgdCfONCd5K5d99ONDROgMFYJ5yQ8ZKvxwgeDEjC03nmS7aoHVn9i3bIUMyd
         6Bl9otZmAXzMyKTEHbdswK1xQ6ErzHxpWWMGQYo65N4aXlBrzRk0AYaJi48DxIKv4Ij/
         dtt2A98mySHXXoOGE/miMxYzE8nQLiWWbcRrA5/xnYY1AdGJLJSPRpa/nn59SF3D7lnN
         W+EA==
X-Forwarded-Encrypted: i=1; AJvYcCVeWC7wLBwnLfgMVTLxpRebPF2isXhBzYTArJTChkZaQUWFqKioWLF9pc6dX3DAUEQf3Lc+HjE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe0W1vodQNl2aowj4pIIKaqWI8+hPwGgMMACsrtMYV19fHGlv2
	w8/Mo4GeVdQOxK8KgdWnHQ4ZpC0oyNCmmYrnZ07au85225XKIfSgT/Nr
X-Gm-Gg: ASbGncsTFMX9Peu1bIpsdQYow4XTwH7whLh04TxJrEwlKsW+lv1r0w6qe8RWDe3Pge9
	JeELm0EqldXHzQ+dKAryG7rrBdQd1ot/ppsePybHPxmMgWpua2fe+BGBn7KZLlhsPcWsSeeN2gK
	VacCBuFeXNCWrZgflGlaXEfWXAiZGqnRQgAQJGp+BCZN5E4C4nzJx9txxhhqNsTuvvEQTR5aOYV
	t1heI23urIalcbx2nnMv9BVsK1emtBmdWu5FK0XSmiEGeWoVDkKz9ZCREblEdDkHFRVjOVcVdGo
	9siO3iK0AyZzpEvNZmCgxTlctgn3NT9NRdHJTQt3Zo0M5NNKcyRSr5BIdBu5Bw==
X-Google-Smtp-Source: AGHT+IGZnsUpzh+ZmsBVRBPZSQgS+0QwmCGnqZeIQPjP/On8etzioYUBd10sRVdO4/dKBZSQ/6l1KQ==
X-Received: by 2002:a05:6a00:994:b0:748:fb7c:bbe0 with SMTP id d2e1a72fcca58-74ea6709f51mr8662943b3a.24.1752123016476;
        Wed, 09 Jul 2025 21:50:16 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74eb9f4bc51sm808024b3a.116.2025.07.09.21.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 21:50:16 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 0/3] riscv: dts: sophgo: Add ethernet support for cv18xx
Date: Thu, 10 Jul 2025 12:49:44 +0800
Message-ID: <175212292374.416883.3089328739735203878.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703021600.125550-1-inochiama@gmail.com>
References: <20250703021600.125550-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 03 Jul 2025 10:15:55 +0800, Inochi Amaoto wrote:
> Add device binding and dts for CV18XX series SoC.
> 
> Change from RFC v4:
> - https://lore.kernel.org/all/20250701011730.136002-1-inochiama@gmail.com
> 1. split the binding patch as a standalone series.
> 
> Change from RFC v3:
> - https://lore.kernel.org/all/20250626080056.325496-1-inochiama@gmail.com
> 1. patch 3: change internal phy id from 0 to 1
> 
> [...]

Applied to for-next, thanks!

[1/3] riscv: dts: sophgo: Add ethernet device for cv18xx
      https://github.com/sophgo/linux/commit/0100910f6ae2659c1178b3ece064c2f2e7eefbae
[2/3] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
      https://github.com/sophgo/linux/commit/a4fb40b240fecc3cf84e12277e5b66818a80e3ad
[3/3] riscv: dts: sophgo: Enable ethernet device for Huashan Pi
      https://github.com/sophgo/linux/commit/8f8de50d4bddf155b5e5c70072c3048829a90a98

Thanks,
Inochi

