Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590DF238C1A
	for <sophgo@lists.linux.dev>; Mon,  1 Jun 2026 02:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780282667; cv=none; b=jMaAHWgTLl5xPRjgSKfWALgZXjnPn9ZS0U8n9ir379iwOW+ICC7umwUaDVPsCvxT4p34hVP+W2W4jLLdYoTHEJJptdqfVsUjjFzI1uG02V3NtDG6HzzTJeRL3PzliFFzSQa1VjPxG/11DvtMfQH4xjnzRdo7lTtofm0WsGOPulY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780282667; c=relaxed/simple;
	bh=6SyTLlkLlY7/nQLNxMMSWjNn0CtqMy26+6iLfA1gO70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VkVNWJyTV4/kLSJhMIE1zU0+OmXAUtgj0jt7AQCFGKs4IssxR4HjAisDz+WoxdM6LMpZLaObXxr18Zyk7V7++e6bnbwrAfo37BPKH9VYJYv3DGRpxBnyAT51xctQKtd7ItkL4Kv23224MW9q7UG5757eqD9y36sfXkXDNceVIco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaKG/19p; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaKG/19p"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36d6bb38b44so756919a91.0
        for <sophgo@lists.linux.dev>; Sun, 31 May 2026 19:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780282665; x=1780887465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4dc1e6o27a5Kq5vwZr329EQ3xcv7LkgpKk1NAl1/Wo=;
        b=jaKG/19pfHH8dAa/bO0JaLUmO39dO19F0V9jEnaDu4ILS7b7hygWMhagRncnKahtcf
         NnUCx9qQWul7oNIn6FKqMkewW3Nv6gIUWFA1kSMjE11WPODJYgU50+JtUzYnLs4k5+yt
         vozcjuJZWYTdPcejSOLSshBJH/OaA8xNLcSj7ASGaN3/Zh2hZOBI+NL/GolD2urwKpvw
         nqITsgcbFNVH/FgzbyPHqTqxtAQ3By/e2B5enaC4PuM0pYUe/NozhulzY1m6mGmr40f6
         07PtLg/VoDVwawTnFo/BioEwHZ3y3QOFposn5fYMxxFPkqMeTXgGj8Bv+vkcHVNrPV/o
         Rz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780282665; x=1780887465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u4dc1e6o27a5Kq5vwZr329EQ3xcv7LkgpKk1NAl1/Wo=;
        b=IMeE5I5Nqw3n3Yq0m2bET7wumi0pEG7voPP614pIJLcfDT2anvDYGOCUCM+elT+5vG
         jb+esJtRs0O+/hCx/fqUUCH5yKGK1LLUBJTYSFByjPMyzeLVz1bpk/8cmZ0ZzMg2cvnG
         RC8BZxbYVSEpQ08ESze9xPJI2FN0tKhrrfjUnq8/wrhVPw2Rz0Y8FuN3TcOBiZpjdp/7
         tZGmzdi84JAdI2MPj1RhVed17gpztFiFCjSPUuNuEG1xukAYFlVfxceQqv1+bxcuDTKB
         uMwAepbtTJu7fGSr8SMrBRs7hOIyZPcUyij4IDDr7dpOhXAClNf7oB8yi49NNm4xY3X+
         R4iw==
X-Forwarded-Encrypted: i=1; AFNElJ8RUaiHaMIGOOjWn35z63zUAISnLy99w25pdaJ4w/9mgHLCyCNRyXZaeIXrgfGVygMbFka6Q1s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyka0OvySUvrht2r3MMOwqbY3gwYQL5xjkl1YiUsVX6BBSA4J5W
	jPDFWl/Xu3pMcbpcM8pZJRY5hNNuZzzP/ZhIEsJrJOT4gMpXbIuF004k
X-Gm-Gg: Acq92OEm9w6L4YkCcJ86PrFNkb3AyqtM90uZWVrHwHaoKreYwfthZLFsrvM+JD3zeby
	jbey2C6gSxXTNAyJtTNuMzp46QJ3lz8M5FwbGdDS92Pq9KxGjX8wmgWa0jAl6Nqe635/f6U6WFD
	R8Al29rTB34nMOXybowOOZGwpFTDH551IcsaCNJr5k4yw80p0mP2jjKSll/+2z6WzWHFNHhv7nM
	tpbW6mzJaLTrfzUrgWedJEpHxPrOpBF0Af7Z9nAU3xyZIMH/IKJd7eAaBEdsdw6yMfvYd2zOJ1m
	q96XHUkoHgsQBb3B3czGOxZdxYR1k113B/cE4/1Tx/7VaT0Ii8dStoQD2RQGzPKKwhLTBFy4xVs
	DIuJAxjtNbQqwI3/l+E0PTqA4I2FsHXvR4qjGTgak8q2NWsZM/Qwz4Rn+kN+6xTpTRjViMhl/2F
	Zjw0uYMPdblH7xCa/oCWpuvEqBZ0/efpPoNQ==
X-Received: by 2002:a17:90b:264e:b0:36a:ee1:fc24 with SMTP id 98e67ed59e1d1-36c4ff41964mr8396209a91.8.1780282665674;
        Sun, 31 May 2026 19:57:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6a340b7sm9065397a91.11.2026.05.31.19.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 19:57:45 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: (subset) [PATCH 0/2] riscv: sophgo: sg2042: Enable PCIe DMA coherence
Date: Mon,  1 Jun 2026 10:57:24 +0800
Message-ID: <178028263198.557087.6386925175219722340.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260331171248.973014-1-gaohan@iscas.ac.cn>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 01 Apr 2026 01:12:46 +0800, Han Gao wrote:
> The SG2042 hardware design supports cache-coherent PCIe.
> 
> With recent firmware updates [1], it allows to use DMA coherent.
> 
> [1] https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36
> 
> Han Gao (2):
>   dt-bindings: pci: sophgo: Add dma-coherent property for SG2042
>   riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
> 
> [...]

Applied to for-next, thanks!

[2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
      https://github.com/sophgo/linux/commit/e728a57834d06b9bbf9bbed69e3ea16416d257d5

Thanks,
Inochi

