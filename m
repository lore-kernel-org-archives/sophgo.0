Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094C3282FA
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 10:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637097; cv=none; b=WWcLfKXUG/pEQ4DHeWyovJZG+OJ4pkpGxI4HVfPLJIBoM9nRDoReJENErfsT17s2E2FMHRg5cHxbaiXGHvuWXbXzyBki42jxrWcrQXFfQwdSUvQ1ZP+rme+xVcGZ9Mb9WpnwKorBkpS8GcOx0xbJ69JHLWlX59BhcqtB/lpNzsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637097; c=relaxed/simple;
	bh=WGrP9tEvMD3BUrTB/EzMwO5IxuAwWTEiAfzuQXCIZvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyPL2RzlFz6XcRm7aiWMcDkpmWndh0HEjxumzYuCJbGQUm2RdtO/1pFcN+qBhMWXkzxPJ/LpJIxe4P8jRNRlTihvEZ4zxCp45KZCn0QCN6huBYDfH9zy86/sYAgANSAlxGKeX3VJwxscc30AEUsYObppWC8aP7Uo8834qc1G4jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIMAWWm+; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIMAWWm+"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6facf4d8e9eso68634106d6.1
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 03:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749637095; x=1750241895; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0H9DqqVIooICLmp4vYW/Nyz3xv6CeQHhJZyVDnOWFA0=;
        b=bIMAWWm+2WelsdLM2cvMzw782Btm9GXV5RCEAPFM/TkQIULl5SBXt0LObfW7FrsTTt
         oaIvZ+VIPmEuY9Kg9Sm3MURBZKInbZ9xAfV8aOqJ8JUEaOSQefz29LKDh5/vpf6p4IPt
         filzU04+e1xpNO0TVpBsEB1ossSZFtdGAAejTXcpH4f4G+tp+/VTy9CiGYgmJ8o3SD3Y
         fveYAE93sdcSS55ujqloPOe1Z33g0cObWoVv1IUPjOBPXEeLJtKUevagQenbhlcvuVOC
         QAL0uEZvgrFlYMoCQhSWaUny0BkGC61bduWpqnkIn/faHMgN8z709q7e1DrIqin/9i7t
         ZwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749637095; x=1750241895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0H9DqqVIooICLmp4vYW/Nyz3xv6CeQHhJZyVDnOWFA0=;
        b=eTTBRkIIDhYfANfpwy/J8i9iGcf3jjLCnM27B20+zou0NrEGzzqhAcNWhfPZEIPUwk
         CFvGnXW7CDx9WWsj1j/mQW9gW6+iq4IPlgdNwnxEmxcfXEHF/Upza8lCSEeen1le9pAv
         Sbht+wAL8Tgj9miQBRrhfz48jAwC9gEjBQ9MZlIwLx+rv/+iCCqS5AggagTrG1vD3r9g
         uynihC6wY56u8NnXIMtMJhz98P6EoKyT8YUqUCUtzQxKUZd2FOG8Oo1UOkarAkQqhJbY
         CdLZA6WTDXmc3oCILUJt6f+zIxr7wGS0sGVDEOtdsqujq4q48cmT5Wxvo63olvbeyuiI
         7Flg==
X-Forwarded-Encrypted: i=1; AJvYcCVWBN1eAsuYCyPokfBNIvup34jSi5qCS/sWhp4EcLZ9x+c13sbNJqxp2FMmpIhN581dXcgPrAM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbn/BavrskxEuazyqg4pE5Hb5nCvD1EMZQaf9fKVKjuejmRZXP
	VU2Tx92PLoiQ1J2orrq126SVcgxDQXoTWKCnzNKANGZr0jR+/FwJKOY2
X-Gm-Gg: ASbGnctaclQjALi/xUHgTOxtyR25msx4qAShOepHbmfKacD9iqyZqYL2/NYk17A3HjO
	qve7W4E+fMY4jYLa/GE8D8HYQg40pU+z9CnyHxz8bNR6yvGavrjWLKcMtPsDHGNyOHACK20nvd2
	MQR51psh228GY4TqlvsA4GkIynEFB9a1iDu8Mz+K+gcS9lIkXt/BRr0b55YfoPooxHelm8cwBnJ
	s82Co5d+ZvlGkT/qx+96xTIk+jDJc+vuih7seJekebLWCiyDD03ErHsPfOpJsG+vGZ+dsNyV9Qg
	XsVPZ8xsdtd3XIKohpCdH1ikK4u6qTvQdy0rTQ==
X-Google-Smtp-Source: AGHT+IFwTEmZcybq7Mt7k025PPfiskyqYi6E6YXzghaXiz9yzSTgjcINKWLcnTMMqF7Kz/++OLzTxQ==
X-Received: by 2002:a05:6214:627:b0:6fa:fe02:8229 with SMTP id 6a1803df08f44-6fb2c38701dmr36593406d6.30.1749637094989;
        Wed, 11 Jun 2025 03:18:14 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09aba071sm80423106d6.24.2025.06.11.03.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 03:18:14 -0700 (PDT)
Date: Wed, 11 Jun 2025 18:17:06 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Richard Cochran <richardcochran@gmail.com>, Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 11/11] riscv: dts: sophgo: add pwm controller for SG2044
Message-ID: <evxmh4zqt5muhbyv2bridgyxw57z3ek7sxn2jp3ma2pyfgxuuv@nn6htxhn2p67>
References: <20250608232836.784737-1-inochiama@gmail.com>
 <20250608232836.784737-12-inochiama@gmail.com>
 <PN0P287MB2258F2BB409F70955D6EE248FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN0P287MB2258F2BB409F70955D6EE248FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>

On Wed, Jun 11, 2025 at 05:53:54PM +0800, Chen Wang wrote:
> "sophgo,sg2044-pwm" should have not been in 6.16, submit this after that?
> 

It is merged for 6.17. So I think it is OK to go.

Regard,
Inochi
