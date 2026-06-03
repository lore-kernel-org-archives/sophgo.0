Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE83F36657B
	for <sophgo@lists.linux.dev>; Wed,  3 Jun 2026 02:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780452419; cv=none; b=VbZ3UMdcxbtoI9R7y4J6m+6TXoPv5JR3Q9pRyjiTurKqjucCyvIyb6YbUF9lu6EG/2jsh9Q69Sgkvxee4Ustsr4woPkiGUXNmllgp8EZu3FBR5Znx8dOjekzCLVyuq/dCfDXd29uiWmL1s0BDnAZioOLr5SAKQaqOuJ6QwtnVgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780452419; c=relaxed/simple;
	bh=j4WcOXqbjT92Y/7VSahHzKe4khJsbf+eMoMhUZRhMMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t9ONgjVqp6T9UkezD/0wYFVY26JvhMhsHQI+WjsmiV2Lult6i7lDk8URsFh4dc1yRYqQmEsmkXMB6gkov7Kfnd10WMlsjvHI5nLpcdp5b0V/1vGnQrp+WflEpSx1CLvaUHbR+h9lfIIpAQUNr17l0hd26xNy+q/7afPzH13TfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ry1Cf5KR; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ry1Cf5KR"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36da8439078so2656458a91.2
        for <sophgo@lists.linux.dev>; Tue, 02 Jun 2026 19:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780452417; x=1781057217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+F1aM3WBZZAtQTaYVDf+ZQQwiErQhbecMAZSECvtDQ=;
        b=ry1Cf5KREgpePj8ICG9Y88BFXZNA5Y3JTL92PmSXO+uDs6i11gLGfMc+7I93gIQ0Kq
         Lal6XzM53uExp3M5RfgTSfW+M9WM0GKfZo7HdqJ4cdLI0QyoFPaUcDg1+JcaD38/YVJu
         LmSOy7Q5Wtk/vOK3iBeT9JgecG9sNZ6oy22/dSrEBfxMkBw2qq2rwPap2kbaWn9ZO8pu
         Jt3AuxVTX5iCBCEk0b8HDg2rkmd/ha2s0MTxNjJe7RyhjkIlanJ4d4/2ijjy4oQKpHyr
         AIkmqlmtLN/S47law8BBSWCl/CrJygpD7VLrnofT2Mi+XqRxrk631L5Zd7428YEkZdN/
         ARfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780452417; x=1781057217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+F1aM3WBZZAtQTaYVDf+ZQQwiErQhbecMAZSECvtDQ=;
        b=O2ud4Zh0M/Wanu0Dtv+fKhUgt+Kv5fhsh0TLI7ALWTD5FqCeonAM9jrcX6E1f9Qn1u
         HlfifLNY/CmxAu+pWkYY0yfLsKgxeBoZ9vWHtWNGMFKDe5H/sh+Os0v1wWtU+wI0EoZj
         6U6DUrnIfuwzjWmVzkM5vBT8D9lVbosGG7QiktgXDXYO0MM1xxtlJJ+iBFTPIbn0BaOz
         S4AwbW3rSzN/sdWU1827Fam/6/lUrFTfeT8TN2jGLtcr46I6jb3teQ6QYfcfsHianPn6
         VdU9rv/Pf6bFRNOo9BSpmP1pWChOAgASqnXfBbLZ+qiAzSuTLj/cEReeshaEfmJQ5r1e
         Fu1Q==
X-Forwarded-Encrypted: i=1; AFNElJ//cJAoV1Glbp8ANMz2FdBps5wMfeNZOnacq+ow6KVpn+gUyVR0xixobWiGc+gNmAjMoCpmJ88=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaN/3pzUc0/rr4o72uDhhyZVOMG6ouO/J78wb645ZXhUVKJWix
	F+yo/xfXUfKNdAhakGSa9tiSDjGt9+8vNqZdHps4O7jEHzgCu8i7HUKt
X-Gm-Gg: Acq92OFNYLXx8kXwIAjYSvYJO37swYliiOnPu3B7I7QqutbexdvTmM5auaV1YHdEwfQ
	u7t2MeD1qypAK4Z4eKpsc9qO8gvExf92JcIo+xJSMruOYY7XI5znte0ZBBgza8DkDfMkZXEj4DY
	rD7fgiFucnR3qnrJck5SJC17OdaGxLJMmkGm7CUyYtWXUywGtQ+8x281BGsh5rRoCgh/6J8FTWh
	ld54HQxptA8xFJPlOy78x8rGhXuUM59BCtinqpvijOx7Lzk2S01g1PvFMUZdumLLum7BSrdFVBD
	RXALMsSCrinAh8gBUX4bdCWrIZ9HE+pnp80WjdpieKVG3eYAqeS39IFl3uq/w+IAz0RtbGanlyW
	QwCeG6o6HtRYVVIsDmPgbqRlyE5cEMXuiMBMscIbwNeffLhD7cPb3D2SNS6u7xPeM1ggphCNjQa
	rvVZ6YaE+PK1jJ06pSJF89V3qKc7BQAA7uHg==
X-Received: by 2002:a17:90b:1d52:b0:36d:70c8:3a3 with SMTP id 98e67ed59e1d1-36e30a28f32mr1195624a91.15.1780452417269;
        Tue, 02 Jun 2026 19:06:57 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9877d85sm4190993a91.14.2026.06.02.19.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:06:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Guodong Xu <guodong@riscstar.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH v2 0/2] riscv: dts: sophgo: Fix CPU unit address for SG2042/SG2044
Date: Wed,  3 Jun 2026 10:06:35 +0800
Message-ID: <178045237640.222315.13582367282574161417.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426013449.694435-1-inochiama@gmail.com>
References: <20260426013449.694435-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 26 Apr 2026 09:34:47 +0800, Inochi Amaoto wrote:
> The CPU unit addres for SG2042/SG2044 misused the decimal number for the
> unit address, Refer to this discussion in the Link, it should be in the
> hex format.
> 
> Link: https://lore.kernel.org/devicetree-spec/00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn/
> 
> Change from v1:
> - https://lore.kernel.org/all/20260406232655.144043-1-inochiama@gmail.com
> 1. Apply Guo, Conor and Chen's tags.
> 2. Remove Link tag for all patches.
> 3. Fix comment for clarification about node name change for all patches.
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: sg2044: use hex for CPU unit address
      https://github.com/sophgo/linux/commit/207cbc477406a72952e27ace2eadbae55164f129
[2/2] riscv: dts: sophgo: sg2042: use hex for CPU unit address
      https://github.com/sophgo/linux/commit/a7e658907686528fe06a11828b04a3e42df9ef18

Thanks,
Inochi

