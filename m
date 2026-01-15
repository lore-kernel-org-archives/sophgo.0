Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E5B199FAC
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 00:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768437356; cv=none; b=RCisvSVEjtrXYOZ+wvFygkpkNW5ljno6XUXmOlNXLtw/G62zTqRGaXik0pxXS2c3RVoQn1cpjhtvIcZs7ZvwnBkZ9Xl91Gowzlx6uiNQviodpKbSQdZpGVpN7K5zIeU7gj+r4cfBRCjosr6mIaEd1ckiGB4lQU4g0uALjvA+9CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768437356; c=relaxed/simple;
	bh=gfyaNAM9bwProfj39nq33cNVyJr2j0VCJfRnp2ikqrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zk+lzR+EVjIdkc8yJ0L9X13F72fE7GFLs+5Zr+sW2ym4NkGq4+pbiwiS0enPKqyu5s7aO1bSYcBLJKaDbRlCKSRi+Hh0P0Pjt4iHFfYpD5qly7EhDjgCRX6LXaJGFhHnqW98rQIH8zeyF94oUt7D35rqPm5a7FCECAwdPShFPDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahtfQfuX; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahtfQfuX"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-11f42e97229so774740c88.0
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 16:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768437354; x=1769042154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czNa2HPASxcpsdkABFpBkldVnBnMqWd7/qbtKUpfVF4=;
        b=ahtfQfuXgajc4dNKK06Idg89yl+IDziWYJAl2WDNuhPT//ztcsMJsf2z+lKI2CWxLK
         9kI8pMXmBQ3sgBRgqn/GHFu0SwKrWX4YXTI8DTKB9NT01XPJ31drKddpqfCSeZm6sMPi
         cRNMkOJ0fA2RJT8qoCAaNsk3anzzAJTVOp27yrS+yQ14OgNZ/9zGk4WpnetWQ48eKIdv
         b9DVpGUJnvuH8RBvMGXV7NdNCwFNuzUuJEphcRGv7xmn+PbwdDLuzOTDX3mJ2ZIk+b8m
         u3dt8wGR72Mfdsn7mVubL6OcoRCHu2lJMV4PZiYa4ooh+WloJtblEaWklkRHvhH1m+cD
         QdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768437354; x=1769042154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=czNa2HPASxcpsdkABFpBkldVnBnMqWd7/qbtKUpfVF4=;
        b=bwtaHihlj3gLeXVaoueDIHCXwZ2n1ff8bB8jRVQ2tUA+l5Kl3muCv1oB14/gMGwUhT
         8DwC0r73WYmlGzpiqzPTgBkM8DY+KZ4XURY1iBoPHDPZlAlDtAd4F0Hx5lf6WFJB7NxE
         5c7trHoUcPJ/H3plRiLtHe7y/3yz00wX1+UIipjGABiShCYOA2KHDBPLP0n4Y68/bZx5
         n77EGK2xQEMozrJu9qUW9KX+118cW3abJM34CW/eAM03alQZdIFU0ZfylGybB5CGF2Xn
         KQLeHJ8LuA5/OC9zo5f0GCqO9MkAT23FfW/C5LKFvAs0omVBmG/7fKhEbdCio8ZolWzX
         aiiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW99HiTmaWUmbZJt/GAxineUFaE/xPv4NTcI532nhxLZlsAqFCZSklYgwKkKLGB6Qjump0wfXg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiJixd/kan52gbL9i1CHswIr1jenJcFAoecwau8nZVw38hdJ8m
	YIj6DpN21cMP12tTuRADd5zP+fJ80PNmMDGHIT5zJXCaeqKu6ofQ7eta
X-Gm-Gg: AY/fxX6neArnlByt4YPN/3kg4U33XsNx4ZriZZ7SQpnc4FEaN6qBdCD0rW7XaK83UYt
	kpyTCIAqEJq73OIWnhc7q/bALGblZQZldYVsvHaCYFsy+1JxD+ZMA+Ln043qUMX9sxsa2nozg9S
	IRs+JwV/gA05rbLPaGm8z2aZaeYOd3d/+tlxPVpRPSNVpq9chgZl92WMEf+32Lh3FTLbzPa5fZ1
	oQICVJiYM1HRot6RfhErhhBMrhRHOaJ3ZZfXEuCYtVsfTt6xkVANvzTi8TAThUDaLm/hv00+JS4
	xFdMF6LwkHIuP1RUDBA99xVMPbxEn6K7/5SUrQEZgsVD36GUw6fSFW+U1vySewIgxTlTPFkJjxT
	cEAXap3xV84FsLiNcHoc3yUWUBbD0wEhr9KC9/K+PMgsx3FwoMpXcWU76DWn7tyjk3b4zlIqKKE
	C39148qyc8+g==
X-Received: by 2002:a05:7023:906:b0:11a:4ffb:9825 with SMTP id a92af1059eb24-12336a47f3cmr5379565c88.6.1768437353929;
        Wed, 14 Jan 2026 16:35:53 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248bb6esm32655086c88.12.2026.01.14.16.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 16:35:53 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: unicorn_wang@outlook.com,
	Michael Orlitzky <michael@orlitzky.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/1] Enable hardware clock (RTC) on the Milk-V Pioneer
Date: Thu, 15 Jan 2026 08:35:48 +0800
Message-ID: <176843728514.411490.2857554435791517315.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107112922.20013-1-michael@orlitzky.com>
References: <20260107112922.20013-1-michael@orlitzky.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 07 Jan 2026 06:29:21 -0500, Michael Orlitzky wrote:
> Add the DTS entries needed for the hardware clock on the Milk-V
> Pioneer. I was able to get this working with an earlier (6.1.x) vendor
> kernel, but it is disabled in the upstream DTS.
> 
> Changes in v2:
>   - Trim extraneous information from the commit message
>   - Link to v1: https://lore.kernel.org/sophgo/20260105120129.58895-1-michael@orlitzky.com
> 
> [...]

Applied to dt/riscv, thanks!

[1/1] riscv: dts: sophgo: enable hardware clock (RTC) on the Milk-V Pioneer
      https://github.com/sophgo/linux/commit/9e81c522680db5998c872fb91ff7877cf3d8ff42

Thanks,
Inochi

