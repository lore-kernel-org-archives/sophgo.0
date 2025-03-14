Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0D417BA1
	for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 23:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741994446; cv=none; b=VZEzsACQqVQyWfQvjPiTHjvzxUJgXW3hhMRkex6XbKG0Aklnc4733qaayWyuAFxsCpvJVQaz520zWnFS0kIyIGR20apTAGwuGYyoAL/vbtX+tU5tOb2HXl39WmUZHnI19a0AqBS1NpebeczS+FkrnRhbkCEK5/Eia6IqVebmHUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741994446; c=relaxed/simple;
	bh=GFPjXPYRlnQIhbr6md5LV8bTp3Z/zVq4lK7qcEWXtPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2JCiQELLF2MR5mE0uwlm42PS8GEwsvRyn8wvHzHOMwnBt4/aqVIeETnPl1+/E7mahlokyPnEikPEvaz96FBf+dulRYGjTeOT3N5EIeCzG7Aur3VqgtGruAX4i5JTUjEalSZiWerAgLs5JGIe4LM5BzH0Ykz2Cl6yYdTYgV5C1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1xHOtEC; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1xHOtEC"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c559b3eb0bso163396285a.1
        for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 16:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741994444; x=1742599244; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iPHaV1z4NWkaWgSXlughOQ6tIsariGFIoAHIEq5GJrg=;
        b=B1xHOtECC3uW9qJGpBqWV/xfP6FnWrtDXQCZqtcVkXjbZJ3PBmv7/v4tCIJLFaL7oL
         RIc53j/90kwUdhpwtqoFVUND6fOk3JxWssWWUKNTeQOftgvKetEE7n2+DeieBqYPRz5f
         Sku8JC3FTTuQyDo1RpMT8/Liz1An7zmRY3mKqeWXy4gtExxTPL5tlda3Ze2RO7DbxT9Q
         78rDap7/u56v2Q9TWKKOFJRty3RPzL5YsmY8PKbmZrf45t23ZuNHxSOkpgNuNiFj6gbh
         30DlD4hWY5B/b6RzMm01UY7emdSVukVlkOhDpwCp0OriNEYeifi3M1EhxxW2OEw272Hv
         3u+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741994444; x=1742599244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iPHaV1z4NWkaWgSXlughOQ6tIsariGFIoAHIEq5GJrg=;
        b=wxiYpwlDCE/FGfA4z6L73w1cHABiyNu3ZCUwbScnTOJ4Uw0igNWyyuUf834L5BHp6a
         flkdy01Ulp1nyPuZWUqmygYTzmql9/KxqhaNVqaWRucrjKZYt2wqut6tkKQ8YqnRQJ0I
         MzhHAJy/9urByjLFLTxWruo/AgAy0hm0yoyTZwNjuj1IvS3g0tG0WedWGa7GVrLpHfr1
         w7t3j57AKsM+0K68hMLsFD1I8OuKe2zbqWdAkpPGljZyiGPHL1ScnaIposiI7TGiBxkk
         TT3Omh7G49Mjn3G0YpFOie5LZGnQHL0XkvrWq0E2jmXdNrGfENZ3uk+P3R4RbBSw6ft8
         w2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Ss9tK8c8ppzwWaOf7pZQwIz7apLgp2c+Gvhm2JzT0tTxNThu/jciOoDCMvsNbBWvDBBb96M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy+jxCFYGzCo2yiMYf7gVLYGSnYj3Ln0nIC9hTL4zkkyzBQoJK
	kdImMwWoJlqHd8tpkwi43r1RsJSmPyJJfMIKUgU25apjCYoSdwCT
X-Gm-Gg: ASbGncvQfYDSkwNLDIIu8UMaKqY8RfHCsMabuzKy/Pj5eNFcuJ66hgbrDR7dtbG2NRR
	zYYus1YlSr0JIhEEDuo+2TEQOPiF7v2o8NMyhmfBTYI56GZki+oPh1r2dswEV2vV6v3+Wy3Max9
	aBdG82oioSnQ/WhybYyOTU/1zGIKjWjnoD6/l/rEJZ9I9DiteAVz4p2tfxf5/5ixFXc6iN5iQSQ
	TJK28Oh+PC91FFXvQYYqPHIe6MI+W2rNX658yyZc1xsl1SuBXb/zPkWzjBo8Xxa/tS7w7bfGn83
	craFPREjfdL4wDlTYW8N
X-Google-Smtp-Source: AGHT+IFj/SlB1MFhDPin66L0iQfr4wDOGbR6n7uiOtlKhc0AhLhsMg5/g8AnbxdPUUK4+Mj4P4Bj8w==
X-Received: by 2002:a05:620a:1b96:b0:7c3:d75c:cc45 with SMTP id af79cd13be357-7c57c8ab6b3mr658626085a.37.1741994444057;
        Fri, 14 Mar 2025 16:20:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c573d9253asm310153485a.104.2025.03.14.16.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:20:43 -0700 (PDT)
Date: Sat, 15 Mar 2025 07:20:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Chen Wang <unicorn_wang@outlook.com>, soc@kernel.org, 
	Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Message-ID: <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
 <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>

On Sat, Mar 15, 2025 at 12:06:44AM +0100, Linus Walleij wrote:
> On Fri, Mar 14, 2025 at 11:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > Are you actually doing incompatible changes here, or is this
> > just about the DT binding?
> 
> If it's just the binding I guess we could do that stunt where we
> apply the same patch independently to both trees and let git
> sort it out.
> 
> Subject "dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC"
> 

Yeah, we only need the first binding patch to provide binding headers.

> Sadly it's not the first patch in the series so you can't pull just that
> from my tree.
> 

I guess this means we should checkout the binding patch in Linus's tree
and merge it without other driver patch? Or just take the binding patch
from the patch serie and let the git ignore the same thing?

Regards,
Inochi
